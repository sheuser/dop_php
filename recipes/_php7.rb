#
# Cookbook Name:: php
# Recipe:: php7
#
node.set['php']['dir'] = '/etc/php'
node.set['php']['conf_dir'] = '/etc/php/7.0/cli'
node.set['php']['ext_conf_dir'] = '/etc/php/7.0/conf.d'

node.set['php']['packages'] = if platform?('ubuntu')
                                %w(
                                  php7.0-fpm
                                  php7.0-cli
                                  php7.0-dev
                                  php7.0-curl
                                  php7.0-gd
                                  php7.0-imap
                                  php7.0-intl
                                  php7.0-json
                                  php7.0-mysql
                                  php7.0-opcache
                                  php7.0-pspell
                                  php7.0-mcrypt
                                  php7.0-ldap
                                  php7.0-xml
                                  php7.0-soap
                                  php7.0-mbstring
                                )
                              else
                                node.set['php']['packages'] = %w(
                                  php7.0-fpm
                                  php7.0-cli
                                  php7.0-dev
                                  php7.0-curl
                                  php7.0-gd
                                  php7.0-imap
                                  php7.0-intl
                                  php7.0-json
                                  php7.0-mysql
                                  php7.0-opcache
                                  php7.0-pspell
                                  php7.0-mcrypt
                                  php7.0-ldap
                                  php7.0-xml
                                )
                              end
node.set['php']['fpm']['service-name'] = 'php7.0-fpm'
node.set['php']['fpm']['dir'] = "#{node['php']['dir']}/7.0/fpm"
node.set['php']['fpm']['ext_conf_dir'] = "#{node['php']['fpm']['dir']}/conf.d"
node.set['php']['fpm']['pool_dir'] = "#{node['php']['fpm']['dir']}/pool.d"
node.set['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.set['php']['fpm']['pidfile'] = "/var/run/#{node['php']['fpm']['service-name']}.pid"
node.set['php']['fpm']['logfile'] = "/var/log/#{node['php']['fpm']['service-name']}/fpm-master.log"
node.set['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.set['php']['fpm']['mods_dir'] = "#{node['php']['dir']}/mods-available"
node.set['php']['fpm']['log_dir'] = "/var/log/#{node['php']['fpm']['service-name']}"
node.set['php']['fpm']['rotfile'] = "/etc/logrotate.d/#{node['php']['fpm']['service-name']}"
node.set['php']['ini']['directives']['fpm'] = node['php']['fpm']['conf']
node.set['php']['fpm']['conf']['global']['error_log'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}.log"
node.set['php']['fpm']['workers']['slow_filename'] = "#{node['php']['fpm']['log_dir']}/#{node['php']['fpm']['service-name']}-slow.log"
