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

name "opscode-pushy-server"
default_version "ma/update_to_r16b03"

source git:  "git://github.com/opscode/opscode-pushy-server"

dependency "erlang"
dependency "rebar"
dependency "curl"
dependency "automake"
dependency "autoconf"
dependency "libuuid"
dependency "libtool"
dependency "bundler"

relative_path "opscode-pushy-server"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  make "distclean", env: env
  make "rel", env: env
  sync "#{project_dir}/rel/opscode-pushy-server/", "#{install_dir}/embedded/service/opscode-pushy-server/"
  delete "#{install_dir}/embedded/service/opscode-pushy-server/log"
end
