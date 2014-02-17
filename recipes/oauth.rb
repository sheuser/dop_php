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
  action :install
end

template "#{node['php']['ext_conf_dir']}/oauth.ini" do
  source "extension.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(:name => "oauth", :directives => [])
  not_if "php -m | grep oauth"
end

package "liboauth-php"
package "liboauth-dev"