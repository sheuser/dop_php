#
# Cookbook Name:: dop_php
# Recipe:: default
#

apt_repository "debian-non-free" do
  uri "http://ftp.de.debian.org/debian"
  distribution node['dotdeb']['distribution']
  components ['non-free']
  action :add
end

include_recipe "php"
include_recipe "php::module_common"
include_recipe "php::fpm"

directory node['php']['fpm']['conf_dir']
directory node['php']['ext_conf_dir']

include_recipe "dop_php::predis"

# The generic php-fpm server config
template "#{node['php']['fpm_conf_dir']}/php-fpm.conf" do
  source "php-fpm.conf.erb"
  variables(
  :phpfpm => node['php']['php-fpm_conf']
  )
  owner "root"
  group "root"
  mode 0644
end

# configure php
template "#{node['php']['fpm_conf_dir']}/php.ini" do
  source "php.ini-production.erb"
  variables(
  :php => node['php']['php_ini']
  )
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[php5-fpm]"
end

# oauth support in curl !
package "libcurl3-dev"

# pear
package "libpcre3-dev"
execute "upgrade-pear" do
  command "pear upgrade pear | cat" # piping through cat appears to be the only sane way of stopping pear returning exit code 1 on no upgrade
end

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
