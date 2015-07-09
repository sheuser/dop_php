#
# Cookbook Name:: php
# Recipe:: gnupg
#

package 'libgpgme11-dev'

php_pear_channel 'pecl.php.net' do
  action :update
end
php_pear 'gnupg' do
  action :install
  not_if { 'php -m | grep gnupg' }
end
execute 'install-gnupg' do
  command 'pecl install gnupg'
  not_if { 'pecl list | grep gnupg' }
end
template "#{node['php']['fpm']['mods_dir']}/gnupg.ini" do
  source 'extension.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(name: 'gnupg', directives: [])
  not_if { 'php -m | grep gnupg' }
end
link "#{node['php']['fpm']['ext_conf_dir']}/20-gnupg.ini" do
  to "#{node['php']['fpm']['mods_dir']}/gnupg.ini"
end
link "#{node['php']['conf_dir']}/conf.d/20-gnupg.ini" do
  to "#{node['php']['fpm']['mods_dir']}/gnupg.ini"
end
