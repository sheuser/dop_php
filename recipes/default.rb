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

pkg = value_for_platform_family(
    [ 'rhel', 'fedora' ] => %w{ php-common php-cli php-mbstring php-gd php-intl php-pspell php-mcrypt php-soap php-sqlite php-xml php-xmlrpc php-fpm }, 
    'debian' => %w{ php5-curl php5-json php5-cli php5-gd php5-intl php5-pspell php5-mcrypt php5-mhash php5-sqlite php5-xsl php5-xmlrpc php5-fpm }
)

pkg.each do |ppkg| 
  package ppkg do
    action :install
  end
end

directory node['php']['fpm']['conf_dir']
directory node['php']['fpm']['log_dir']
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
  cookbook "dop_php"
  source "php.ini.erb"
  variables(
    :php => node['php']['php_ini']
  )
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[php5-fpm]"
end

# pear
package "libpcre3-dev"
execute "upgrade-pear" do
  command "pear upgrade pear | cat" # piping through cat appears to be the only sane way of stopping pear returning exit code 1 on no upgrade
end