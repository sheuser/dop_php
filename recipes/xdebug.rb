#
# Cookbook Name:: php
# Recipe:: xdebug
#

include_recipe 'build-essential'

xdebug_src_filepath = "#{Chef::Config['file_cache_path']}/#{node['php']['xdebug']['filename']}.tar.gz"
xdebug_extract_path = Chef::Config['file_cache_path']

unless ::File.exist?(xdebug_src_filepath)
  remote_file xdebug_src_filepath do
    source node['php']['xdebug']['download_url']
  end
  bash 'extract_xdebug' do
    cwd ::File.dirname(xdebug_src_filepath)
    code <<-EOH
      tar xzf #{xdebug_src_filepath} --no-same-owner -C #{xdebug_extract_path}
      cd #{node['php']['xdebug']['filename']}
      phpize
      ./configure --enable-xdebug
      make
      make install
      echo '#{node['php']['xdebug']['checksum']}' > #{Chef::Config['file_cache_path']}/xdebug-VERSION
    EOH
    not_if "test `cat #{Chef::Config['file_cache_path']}/xdebug-VERSION` == #{node['php']['xdebug']['checksum']}"
    creates "#{Chef::Config['file_cache_path']}/xdebug-VERSION"
  end
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
