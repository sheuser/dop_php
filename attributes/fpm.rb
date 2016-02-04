# # # # # #
# php-fpm #
# # # # # #
default['php']['fpm']['dir'] = "#{node['php']['dir']}/fpm"
default['php']['fpm']['ext_conf_dir'] = "#{node['php']['fpm']['dir']}/conf.d"
default['php']['fpm']['pool_dir'] = "#{node['php']['fpm']['dir']}/pool.d"
default['php']['fpm']['log_dir'] = '/var/log/php5-fpm'
default['php']['fpm']['pidfile'] = '/var/run/php5-fpm.pid'
default['php']['fpm']['logfile'] = '/var/log/php5-fpm/fpm-master.log'
default['php']['fpm']['rotfile'] = '/etc/logrotate.d/php5-fpm'
default['php']['fpm']['mods_dir'] = "#{node['php']['dir']}/mods-available"
default['php']['fpm']['log_dir'] = '/var/log/php5-fpm'
default['php']['fpm']['user'] = 'www-data'
default['php']['fpm']['group'] = 'www-data'
default['php']['fpm']['rotfile'] = '/etc/logrotate.d/php5-fpm'
default['php']['fpm']['create_pool'] = false
default['php']['fpm']['service-name'] = 'php5-fpm'

default['php']['ini']['directives']['fpm'] = node['php']['fpm']['conf']

default['php']['fpm']['conf']['global']['daemonize'] = 'yes'
default['php']['fpm']['conf']['global']['pid'] = node['php']['fpm_pidfile']
default['php']['fpm']['conf']['global']['error_log'] = "#{node['php']['fpm']['log_dir']}/php5-fpm.log"
default['php']['fpm']['conf']['global']['log_level'] = 'notice'
default['php']['fpm']['conf']['global']['emergency_restart_threshold'] = '10'
default['php']['fpm']['conf']['global']['emergency_restart_interval'] = '1m'
default['php']['fpm']['conf']['global']['process_control_timeout'] = '10s'

default['php']['fpm']['user'] = 'www-data'
default['php']['fpm']['group'] = 'www-data'
default['php']['fpm']['workers']['user'] = node['php']['fpm']['user']
default['php']['fpm']['workers']['group'] = node['php']['fpm']['group']
default['php']['fpm']['workers']['ip_address'] = '127.0.0.1'
default['php']['fpm']['workers']['port'] = 9_000
default['php']['fpm']['workers']['status_url'] = '/php-fpm-status'
default['php']['fpm']['workers']['ping_url'] = '/php-fpm-ping'
default['php']['fpm']['workers']['max_children'] = 64
default['php']['fpm']['workers']['start_servers'] = 6
default['php']['fpm']['workers']['min_spare_servers'] = 6
default['php']['fpm']['workers']['max_spare_servers'] = 12
default['php']['fpm']['workers']['max_requests'] = 10_000
default['php']['fpm']['workers']['catch_workers_output'] = false
default['php']['fpm']['workers']['backlog'] = 1_024
default['php']['fpm']['workers']['slow_timeout'] = 5
default['php']['fpm']['workers']['slow_filename'] = "#{node['php']['fpm']['log_dir']}/php5-fpm-slow.log"
default['php']['fpm']['workers']['terminate_timeout'] = node['php']['php_ini']['php']['max_execution_time'].to_i + 20
default['php']['fpm']['workers']['flag_overrides'] = {}
default['php']['fpm']['workers']['value_overrides'] = {}
default['php']['fpm']['workers']['env_overrides'] = {}
