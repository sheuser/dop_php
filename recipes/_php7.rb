#
# Cookbook Name:: php
# Recipe:: php7
#
node.default['php']['dir'] = '/etc/php'
node.default['php']['conf_dir'] = '/etc/php/7.0/cli'
node.default['php']['ext_conf_dir'] = '/etc/php/7.0/conf.d'
node.default['php']['packages'] = %w(
  php7.0-fpm
  php7.0-cli
  php7.0-dev
  php7.0-curl
  php7.0-gd
  php7.0-imap
  php7.0-intl
  php7.0-json
  php7.0-mcrypt
  php7.0-mysql
  php7.0-opcache
  php7.0-pspell
)
node.default['php']['fpm']['service-name'] = 'php7.0-fpm'
node.default['php']['fpm']['dir'] = "#{node['php']['dir']}/7.0/fpm"
node.default['php']['fpm']['ext_conf_dir'] = "#{node['php']['fpm']['dir']}/conf.d"
node.default['php']['fpm']['pool_dir'] = "#{node['php']['fpm']['dir']}/pool.d"
node.default['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.default['php']['fpm']['pidfile'] = "/var/run/#{node['php']['fpm']['service-name']}.pid"
node.default['php']['fpm']['logfile'] = "/var/log/#{node['php']['fpm']['service-name']}/fpm-master.log"
node.default['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.default['php']['fpm']['mods_dir'] = "#{node['php']['dir']}/mods-available"
node.default['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.default['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.default['php']['ini']['directives']['fpm'] = node['php']['fpm']['conf']
node.default['php']['fpm']['conf']['global']['error_log'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}.log"
node.default['php']['fpm']['workers']['slow_filename'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}-slow.log"
