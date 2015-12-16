#
# Cookbook Name:: php
# Recipe:: pear
#

package 'expect'

cookbook_file '/tmp/install-pear.sh' do
  source 'install-pear.sh'
  mode 0755
  only_if { !File::exists?('/usr/bin/pear') }
end

execute 'install_pear' do
  command '/tmp/install-pear.sh'
  action :run
  notifies :run, 'execute[remove pear installer]', :delayed
  only_if { !File::exists?('/usr/bin/pear') }
end

execute 'remove pear installer' do
  command 'rm -f /tmp/install-pear.sh'
  action :nothing
end
