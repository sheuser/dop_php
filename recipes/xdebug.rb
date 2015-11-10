#
# Cookbook Name:: php
# Recipe:: xdebug
#

include_recipe 'build-essential'

php_pear 'xdebug' do
  action :install
  not_if 'php -m | grep xdebug'
end
execute 'install-xdebug' do
  command "pecl install xdebug"
  not_if 'pecl list | grep xdebug'
end

template "#{node['php']['fpm']['mods_dir']}/xdebug.ini" do
  source 'extension.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    name: 'xdebug',
    zend: true,
    directives: node['php']['xdebug']['ini']
  )
  not_if 'php -m | grep xdebug'
end

link "#{node['php']['fpm']['ext_conf_dir']}/20-xdebug.ini" do
  to "#{node['php']['fpm']['mods_dir']}/xdebug.ini"
  only_if { node['php']['xdebug']['enabled'] }
end

link "#{node['php']['conf_dir']}/conf.d/20-xdebug.ini" do
  to "#{node['php']['fpm']['mods_dir']}/xdebug.ini"
  only_if { node['php']['xdebug']['cli']['enabled'] }
end

directory node['php']['xdebug']['ini']['remote_log_dir']
file node['php']['xdebug']['ini']['remote_log'] do
  owner 'root'
  group 'root'
  mode 0777
  action :create_if_missing
end
