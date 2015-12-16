#
# Cookbook Name:: php
# Recipe:: default
#
if node['php']['version'] == '7.0' do
  include_recipe 'php::_php7'
  include_recipe 'php::_pear'
end
include_recipe 'php::_package'
include_recipe 'php::_fpm'
include_recipe 'composer'

package 'libpcre3-dev'

# update the main channels
php_pear_channel 'pear.php.net' do
  action :update
end
php_pear_channel 'pecl.php.net' do
  action :update
end

# pear
execute 'upgrade-pear' do
  command 'pear upgrade pear | cat' # piping through cat appears to be the only sane way of stopping pear returning exit code 1 on no upgrade
end
