#
# Cookbook Name:: dop_php
# Recipe:: oauth
#

# oauth support in curl !
package "libcurl3-dev"

php_pear_channel 'pecl.php.net' do
  action :update
end

php_pear "oauth" do
	action ( !(`pear list | grep oauth`.empty?) ) ? :upgrade : :install
end

template "#{node['php']['fpm']['mods_dir']}/oauth.ini" do
  source "extension.ini.erb"
  owner "root"
  group "root"
  mode 0644
  variables(:name => "oauth", :directives => [])
  not_if "php -m | grep oauth"
end

link "#{node['php']['fpm']['conf_dir']}/20-oauth.ini" do
  to "#{node['php']['fpm']['mods_dir']}/oauth.ini"
end

package "liboauth-php"
package "liboauth-dev"