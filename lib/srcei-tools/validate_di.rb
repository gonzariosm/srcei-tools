require 'mechanize'

module SRCEITools
  class ValidateDI
    attr_writer :doc_type
    attr_writer :doc_run

    def doc_type=(doc_type)
      # Valid options in select document
      valid = ['CEDULA', 'CEDULA_EXT', 'PASAPORTE_PG', 'PASAPORTE_DIPLOMATICO', 'PASAPORTE_OFICIAL']
      # if not valid option set default CEDULA
      @doc_type = (valid).include?(@doc_type) ? @doc_type : 'CEDULA'
    end

    def initialize(doc_run, doc_type, doc_number)
      self.doc_run = doc_run
      self.doc_type = doc_type
      @doc_number = doc_number
    end

    def self.valid?(doc_run, doc_type, doc_number)
      new( doc_run, doc_type, doc_number ).check_document
    end

    def check_document
      # URL SRCEI to validate document
      url = 'https://portal.sidiv.registrocivil.cl/usuarios-portal/pages/DocumentRequestStatus.xhtml'

      # Set Agent to navigate web
      a = Mechanize.new do |agent|
        agent.user_agent_alias = 'Mac Safari'
        agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      begin
        a.get(url) do |page|

          form = page.form_with(:id => 'form') do |f|
            f['form:run'] = @doc_run
            f['form:selectDocType'] = @doc_type
            f['form:docNumber'] = @doc_number
          end.click_button

          doc = form.parser
          # Get value (Vigente | No Vigente | Empty)
          status = doc.at('tr [@class="setWidthOfSecondColumn"]').text

          if( status == 'Vigente' )
            return true
          else
            return false
          end
        end
      rescue Mechanize::ResponseCodeError => e
        return false
      end
    end

  end
end
