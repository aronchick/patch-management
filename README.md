Patch Management Cookbook
=================

This cookbook is designed to test and optionally remediate vulnerabilities based on detecting package and/or hotfix numbers.

Limitations
------------
Hotfixes rolled up into cumulative fixes may not be detected on Windows.

Requirements
------------

### Platform:

* Should work on a wide variety of other systems

### Cookbook Dependencies:

* None

Attributes
----------
Non-Windows
* default['package-name'] = The name (as listed in the repo) for the package to check (where available)
* default['package-version'] = The version number (as listed in the repo) for the package to verify

Windows
* default['hotfix-number'] = The number of the hotfix (as identified by KB0123456) which addresses the vulnerability

Recipes
-------

### patch-management::default

* Detects and remediates systems using native patch management tools

### patch-management::audit

* Audits system based on attributes.

### patch-management::remediate

* Updates the vulnerable package to the latest version according to the repository associated with the system.
* 
Testing
-------

### Chefspec
* Includes a Chefspec suite. This can be run with rspec.

### Test Kitchen / Serverspec
* Includes Test-kitchen support for Ubuntu 12.04 and Centos 6.5 operating systems. The .kitchen.yml file defaults to the Vagrant driver. Universal Serverspec tests valid for both operating systems are included.

License and Author
------------------

Author:: Chef Software, Inc (support@getchef.com)  
Author:: Charles Johnson (charles@getchef.com)  
Author:: Nicolas Rycar (nrycar@getchef.com)  
Author:: Julian Dunn (jdunn@getchef.com)
Author:: David Aronchick (daronchick@getchef.com)  

Copyright:: 2014, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
