name              'patch-management'
maintainer        'Chef Software, Inc.'
maintainer_email  'support@getchef.com'
license           'Apache 2.0'
description       'Template for auditing & remediating vulnerabilities'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'
recipe            'patch-management::default', 'Wraps audit and remediation recipes'
recipe            'patch-management::audit', 'Detects vulnerabilities based on attributes set in attributes/default.rb'
recipe            'patch-management::remediate', 'Updates packages based on attributes set in attributes/default.rb'

%w{centos debian fedora freebsd gentoo redhat scientific oracle ubuntu windows}.each do |os|
  supports os
end

