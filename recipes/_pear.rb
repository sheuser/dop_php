#
# Cookbook Name:: php
# Recipe:: pear
#

package 'expect'

src_filename = node['php']['pear']['filename']
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"

remote_file src_filepath do
  source node['php']['pear']['download_url']
  checksum node['php']['pear']['checksum']
  only_if { !File.exist?('/usr/bin/pear') }
end

cookbook_file "#{Chef::Config['file_cache_path']}/install-pear.sh" do
  source 'install-pear.sh'
  mode 0755
  only_if { !File.exist?('/usr/bin/pear') }
end

execute 'install_pear' do
  cwd Chef::Config['file_cache_path']
  command "#{Chef::Config['file_cache_path']}/install-pear.sh"
  action :run
  only_if { !File.exist?('/usr/bin/pear') }
end
