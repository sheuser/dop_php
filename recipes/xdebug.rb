#
# Cookbook Name:: dop_php
# Recipe:: xdebug
#

include_recipe "build-essential"

# install/upgrade xdebug
package = "xdebug"

php_pear package do
    if node['php']['xdebug']['version'] != "latest"
        version "#{node['php']['xdebug']['version']}"
    end
    #upgrade when package is installed and latest version is required
    action ( !(`pear list | grep #{package}`.empty?) and node['php']['xdebug']['version'] == "latest" ) ? :upgrade : :install
end

# copy over xdebug.ini to node
template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "zend_extension.ini.erb"
  variables(:name => "xdebug", :directives => [])
  owner "root"
  group "root"
  mode 0644
  not_if "php -m | grep xdebug"
end

file node['php']['xdebug']['remote_log'] do
  owner "root"
  group "root"
  mode 0777
  action :create_if_missing
end