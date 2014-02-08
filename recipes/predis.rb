#
# Cookbook Name:: dop_php
# Recipe:: predis
#

include_recipe "redisio::install"
include_recipe "redisio::enable"

# symlink redis-cli into /usr/bin
link "/usr/bin/redis-cli" do
  to "/usr/local/bin/redis-cli"
end

include_recipe "git"

# build dependencies
package "make" do
  action :install
end

directory "/tmp/phpredis" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

git "/tmp/phpredis" do
  repository node['phpredis']['url']
  revision node['phpredis']['revision']
  action :sync
  not_if "php -m | grep redis"
end

bash "make & install phpredis" do
  cwd "/tmp/phpredis"
  code <<-EOF
  phpize
  ./configure
  make && make install
  EOF
  not_if "php -m | grep redis"
end

template "#{node['php']['ext_conf_dir']}/redis.ini" do
  source "extension.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(:name => "redis", :directives => [])
  not_if "php -m | grep redis"
end

logrotate_app "redis" do
  cookbook "logrotate"
  path "#{node["redis"]["log_dir"]}/*.log"
  frequency "daily"
  rotate 2
  options ["missingok", "compress", "delaycompress", "notifempty", "sharedscripts"]
  postrotate "[ -f #{node["redis"]["base_piddir"]}/master ] && kill -USR1 `cat #{node["redis"]["base_piddir"]}/master`"
  create "640 #{node['redisio']['default_settings']['user']} #{node['redisio']['default_settings']['group']}"
end