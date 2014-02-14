#
# Cookbook Name:: dop_php
# Recipe:: oauth
#

# oauth support in curl !
package "libcurl3-dev"

php_pear "oauth" do
  action :install
end

file "#{node['php']['fpm']['conf_dir']}/oauth.ini" do
  content "extension=oauth.so"
  mode 0644
  action :create
end

package "liboauth-php"
package "liboauth-dev"