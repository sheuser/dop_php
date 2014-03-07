# # # # # #
# default #
# # # # # #
include_attribute "dop_php::dotdeb"
include_attribute "dop_php::ioncube"

default['php']['packages'] = [ 
  'php5-cgi',
  'php5',
  'php5-dev',
  'php5-cli',
  'php-pear',
  'php5-mcrypt',
  'php5-gd',
  'php5-mysql',
  'php5-curl',
  'php-pear',
  'php5-dev',
  'php-soap',
  'php5-ldap',
  'php5-imap'
]

default['php']['php_ini']['php']['short_open_tag'] = "On"
default['php']['php_ini']['php']['serialize_precision'] = 100
default['php']['php_ini']['php']['realpath_cache_size'] = "512k"
default['php']['php_ini']['php']['realpath_cache_ttl'] = 84600
default['php']['php_ini']['php']['expose_php'] = "Off"
default['php']['php_ini']['php']['max_execution_time'] = 360
default['php']['php_ini']['php']['memory_limit'] = "1256M"
default['php']['php_ini']['php']['error_reporting'] = "E_ALL & ~E_NOTICE | E_DEPRECATED"
default['php']['php_ini']['php']['html_errors'] = "Off"
default['php']['php_ini']['php']['post_max_size'] = "64M"
default['php']['php_ini']['php']['upload_max_filesize'] = "64M"
default['php']['php_ini']['php']['allow_url_fopen'] = "Off"
default['php']['php_ini']['php']['html_errors'] = "Off"
default['php']['php_ini']['date']['date.timezone'] = "Europe/Berlin"
default['php']['php_ini']['session']['session.cookie_lifetime'] = 3600
default['php']['php_ini']['opcache']['opcache.enable'] = "On"

# # # # # #
# php-fpm #
# # # # # #
default['php']['fpm']['conf_dir'] = "#{node['php']['fpm_conf_dir']}/conf.d"

default['php']['php-fpm_conf']['global']['pid'] = node['php']['fpm_pidfile']
default['php']['php-fpm_conf']['global']['error_log'] = node['php']['fpm_logfile']
default['php']['php-fpm_conf']['global']['log_level'] = "notice"
default['php']['php-fpm_conf']['global']['emergency_restart_threshold'] = "10"
default['php']['php-fpm_conf']['global']['emergency_restart_interval'] = "1m"
default['php']['php-fpm_conf']['global']['process_control_timeout'] = "10s"

default['php']['fpm']['user'] = node['php']['fpm']['user']
default['php']['fpm']['group'] =  node['php']['fpm']['group']
default['php']['fpm']['workers']['user'] = node['php']['fpm']['user']
default['php']['fpm']['workers']['group'] = node['php']['fpm']['group']
default['php']['fpm']['workers']['ip_address'] = "127.0.0.1"
default['php']['fpm']['workers']['port'] = 9000
default['php']['fpm']['workers']['max_children'] = 64
default['php']['fpm']['workers']['start_servers'] = 6
default['php']['fpm']['workers']['min_spare_servers'] = 6
default['php']['fpm']['workers']['max_spare_servers'] = 12
default['php']['fpm']['workers']['max_requests'] = 10000
default['php']['fpm']['workers']['catch_workers_output'] = false
default['php']['fpm']['workers']['backlog'] = 1024
default['php']['fpm']['workers']['slow_timeout'] = 5
default['php']['fpm']['workers']['terminate_timeout'] = node['php']['php_ini']['php']['max_execution_time'].to_i + 20
default['php']['fpm']['workers']['flag_overrides'] = {}
default['php']['fpm']['workers']['value_overrides'] = {}
default['php']['fpm']['workers']['env_overrides'] = {}