# srcei-tools

srcei-tools is a Ruby library for validating Serial Number Chilean Document. [You can check in](https://portal.sidiv.registrocivil.cl/usuarios-portal/pages/DocumentRequestStatus.xhtml) on Registro Civil

## INSTALLATION

    gem install srcei-tools

The gem should be compatible with most Ruby versions.

## USAGE
```ruby
require 'srcei-tools'
# the parameters are RUT, Document Type and Serial Number
SRCEITools::ValidateDI.valid?("55555555-5", "CEDULA", "103500XXX")
=> true
```

In Document Type Parameters you can use

* CEDULA
* CEDULA_EXT
* PASAPORTE_PG
* PASAPORTE_DIPLOMATICO
* PASAPORTE_OFICIAL

----------------------------------------

## License

This library is distributed under the MIT license.  Please see the [LICENSE](https://github.com/xalupeao/srcei-tools/blob/master/LICENSE) file.
