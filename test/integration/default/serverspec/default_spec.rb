require 'spec_helper'

describe 'patch-management::default' do

  describe file('/etc/chef/ohai_plugins/detect.rb') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

end
