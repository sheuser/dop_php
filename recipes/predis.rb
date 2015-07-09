#
# Cookbook Name:: php
# Recipe:: predis
#

# symlink redis-cli into /usr/bin
link '/usr/bin/redis-cli' do
  to '/usr/local/bin/redis-cli'
end

include_recipe 'git'
include_recipe 'redisio'
include_recipe 'redisio::enable'

# build dependencies
package 'build-essential'

directory '/tmp/phpredis' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

git '/tmp/phpredis' do
  repository node['phpredis']['url']
  revision node['phpredis']['revision']
  action :sync
  not_if 'php -m | grep redis'
end

bash 'make & install phpredis' do
  cwd '/tmp/phpredis'
  code <<-EOF
  phpize
  ./configure
  make && make install
  EOF
  not_if 'php -m | grep redis'
end

template "#{node['php']['fpm']['mods_dir']}/redis.ini" do
  source 'extension.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    name: 'redis',
    zend: false,
    directives: []
  )
  not_if 'php -m | grep redis'
end

link "#{node['php']['fpm']['ext_conf_dir']}/20-redis.ini" do
  to "#{node['php']['fpm']['mods_dir']}/redis.ini"
end

link "#{node['php']['conf_dir']}/conf.d/20-redis.ini" do
  to "#{node['php']['fpm']['mods_dir']}/redis.ini"
end
