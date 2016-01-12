#
# Cookbook Name:: php
# Recipe:: oauth
#

# oauth support in curl !
package 'libcurl3-dev'

php_pear_channel 'pecl.php.net' do
  action :update
end

php_pear 'oauth' do
  version '1.2.3' # stick to php5 compatibility
  action :install
  not_if 'php -m | grep oauth'
end
execute 'install-oauth' do
  command 'pecl install oauth-1.2.3'
  not_if 'pecl list | grep oauth'
end

template "#{node['php']['fpm']['mods_dir']}/oauth.ini" do
  source 'extension.ini.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(
    name: 'oauth',
    zend: false,
    directives: []
  )
  not_if 'php -m | grep oauth'
end

link "#{node['php']['fpm']['ext_conf_dir']}/20-oauth.ini" do
  to "#{node['php']['fpm']['mods_dir']}/oauth.ini"
end

link "#{node['php']['conf_dir']}/conf.d/20-oauth.ini" do
  to "#{node['php']['fpm']['mods_dir']}/oauth.ini"
end

package 'liboauth-php'
package 'liboauth-dev'
