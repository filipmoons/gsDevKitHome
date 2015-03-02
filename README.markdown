# Puppet module for GsDevKit
A puppet module that installs all the requirements to get GsDevKit running.
More information about gsDevKitHome can be found at https://github.com/GsDevKit/gsDevKitHome.

The module was developed as part of an internship at Yes-plan (Belgian company for event-planning software) by Filip Moons (computer science student), under the guidance of Johan Brichau.

## What does it do?
This module does install webEditionHome and starts a GemStone. 
It does the following:
- Installing Gemstone/S (you can choose the GemStone version, see below)
- Setting up environment variables
- Installs Seaside 3.1.0
- Starts a Gemstone

Please visit https://github.com/GsDevKit/gsDevKitHome for additional information about the procedure.

### Usage
```puppet
include gsDevKitHome
# or
class { "gsDevKitHome: }
```

#### Customising
```puppet
class { "gsDevKitHome::install":
 	$gemstone_version => "3.2.0",       # Version of GemStone you want to install
 	$service => "Zinc", #Service you want to use
 	$ports => "8383", #Port or ports (for FastCGI) you use.
}
```

### Contribute
Any contributions are welcome. There are no crazy requirements to contribute.

1. Fork the project
2. Make your changes
3. Create a Pull Request
