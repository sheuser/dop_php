#
# Cookbook Name:: php
# Recipe:: pear
#

package 'expect'

cookbook_file '/tmp/install-pear.sh' do
  source 'install-pear.sh'
  mode 755
end

execute 'install_pear' do
  command '/tmp/install-pear.sh'
  action :run
  notifies :run, "execute[remove pear installer]", :delayed
end

execute 'remove pear installer' do
  command 'rm -f /tmp/install-pear.sh'
  action :nothing
end
