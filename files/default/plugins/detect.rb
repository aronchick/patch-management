#
# Author:: David Aronchick (<jdunn@getchef.com>)
# Copyright:: Copyright (c) 2014, Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Ohai.plugin(:'DetectVulnerability') do
  depends 'languages/detect_vulnerability'
  depends 'languages'

  def package_version
    # Using the below code, you can detect the version of the package running on your system.

    if default['package-name'] then
      default['package-name'] do
        languages[:detect_vulnerability][:version] = node['platform_version']
      end
    elsif default['hotfix-number'] then
      # NOTE: This functionality is not currently available on Windows, and will return null
      nil
    else
      raise PackageNameOrHotfixNameNotSpecified
    end

  end

  def vulnerable?
    if default['package-name'] then
      raise PackageVersionNotEntered if default['package_version'] == nil
      package_version == default['package_version']
    end

    if default['hotfix-number'] then
      hofix_detected = false

      default['hotfix-number'].each do |hotfix|
        powershell_script "Detect all hotfixes entered to see if they have been applied" do
          only_if {
            detected = powershell_out("return !(get-hotfix -id #{hotfix} -ErrorAction SilentlyContinue)").stdout.chop
            hofix_detected ||= detected
          }
        end
      end

      hofix_detected
    end
  end

  collect_data do
    languages[:detect_vulnerability] = Mash.new
    languages[:detect_vulnerability][:vulnerable] = vulnerable?
  end
end
