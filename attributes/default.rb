#
# Cookbook Name:: patch-management
# Attributes:: default
#
# Copyright (C) 2014 Chef Software, Inc. <support@getchef.com>
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

default['ohai']['plugins']['patch-management'] = 'plugins'

# If using a package manager such as apt, yum, etc etc, uncomment and enter the package you are looking to verify below.
# default['package-name'] = 'chef'
# default['package-version'] = '1.0.1'

# If using Windows, uncomment the lines below and enter the hotfix name. This should take the form of 'KB0123456'.
# If there are multiple hotfixes which may apply (such as with a cumulative update), simply add additional lines for each one to check.
# default['hotfix-number'] = []
# default['hotfix-number'] << 'KB0123456'
# default['hotfix-number'] << 'KB5678901'

# Delete the below line when complete
raise PackageNameNotEntered
