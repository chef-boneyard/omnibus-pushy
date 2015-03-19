#
# Copyright 2012-2014 Chef Software, Inc.
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

name       "opscode-push-jobs-server"
maintainer "Chef Software, Inc."
homepage   "http://www.getchef.com"

install_dir    "/opt/opscode-push-jobs-server"
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# Pin cacerts to an earlier version because the latest is missing some certs
# https://github.com/opscode/opscode-omnibus/commit/8efcebf946e2662a6fd52ed1ee66f198dbca3a8d
override :cacerts, version: '2014.08.20'
override :berkshelf, version: "2.0.18"
override :erlang, version: "R16B03-1"
override :'omnibus-ctl', version: '0.3.1'

# creates required build directories
dependency "preparation"

# global
dependency "libffi"
dependency "chef-gem"
dependency "pushy-server-cookbooks"
dependency "pushy-server-scripts"
dependency "opscode-pushy-server-ctl"
dependency "runit"

dependency "opscode-pushy-server"
dependency "pushy-server-schema"
dependency "oc-pushy-pedant"

# version manifest file
dependency "version-manifest"

package :rpm do
  signing_passphrase ENV['OMNIBUS_RPM_SIGNING_PASSPHRASE']
end
