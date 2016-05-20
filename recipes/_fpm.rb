#
# Cookbook Name:: php
# Recipe:: _fpm
#

file "#{node['php']['fpm']['pool_dir']}/www.conf" do
  action :delete
end

directory node['php']['fpm']['mods_dir']
directory node['php']['fpm']['ext_conf_dir']
directory node['php']['fpm']['log_dir']
directory node['php']['ext_conf_dir']

# Ubuntu uses a separate ini for FPM
template "#{node['php']['fpm']['ext_conf_dir']}/php.ini" do
  source 'php.ini.erb'
  owner 'root'
  group 'root'
  notifies :restart, "service[#{node['php']['fpm']['service-name']}]"
  mode 0644
  variables(php: node['php']['php_ini'])
end

# The generic server config
template "#{node['php']['fpm']['ext_conf_dir']}/php-fpm.conf" do
  source 'php-fpm.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(phpfpm: node['php']['fpm']['conf'])
  notifies :restart, "service[#{node['php']['fpm']['service-name']}]"
end

# For the pool log files
directory node['php']['fpm']['log_dir'] do
  owner 'root'
  group 'root'
  mode 01733
  action :create
end

# Log rotation file
template node['php']['fpm']['rotfile'] do
  source 'php-fpm.logrotate.erb'
  owner 'root'
  group 'root'
  mode 00644
end

# Since we do not have any pool files we do not attempt to start the service
service node['php']['fpm']['service-name'] do
  supports start: true, stop: true, reload: true, restart: true, status: true
  action [:enable]
end

# create php-fpm pool
php_fpm 'master' do
  user node['php']['fpm']['user']
  group node['php']['fpm']['group']
  catch_workers_output node['php']['fpm']['workers']['catch_workers_output']
  ip_address node['php']['fpm']['workers']['ip_address']
  port node['php']['fpm']['workers']['port']
  status_url node['php']['fpm']['workers']['status_url']
  ping_url node['php']['fpm']['workers']['ping_url']
  slow_filename node['php']['fpm']['workers']['slow_filename']
  max_children node['php']['fpm']['workers']['max_children']
  start_servers node['php']['fpm']['workers']['start_servers']
  min_spare_servers node['php']['fpm']['workers']['min_spare_servers']
  max_spare_servers node['php']['fpm']['workers']['max_spare_servers']
  max_requests node['php']['fpm']['workers']['max_requests']
  backlog node['php']['fpm']['workers']['backlog']
  slow_timeout node['php']['fpm']['workers']['slow_timeout']
  terminate_timeout node['php']['fpm']['workers']['terminate_timeout']
  flag_overrides node['php']['fpm']['workers']['flag_overrides']
  value_overrides node['php']['fpm']['workers']['value_overrides']
  env_overrides node['php']['fpm']['workers']['env_overrides']
  action :add
  only_if { node['php']['fpm']['create_pool'] }
end
