# # # # # #
# default #
# # # # # #
default['php']['dir'] = '/etc/php5'
default['php']['conf_dir'] = '/etc/php5/cli'
default['php']['ext_conf_dir'] = '/etc/php5/conf.d'
default['php']['session_dir'] = '/var/lib/php5/session'
default['php']['upload_dir'] = '/var/lib/php5/uploads'

default['php']['version'] = '5.5'
default['php']['packages'] = %w(
  php5-cgi
  php5
  php5-dev
  php5-cli
  php-pear
  php5-mcrypt
  php5-gd
  php5-mysql
  php5-curl
  php-pear
  php5-dev
  php-soap
  php5-ldap
  php5-imap
  php5-json
  php5-intl
  php5-pspell
  php5-mhash
  php5-sqlite
  php5-xsl
  php5-xmlrpc
  php5-fpm
  php5-imagick
  php5-memcache
)

default['php']['php_ini']['php']['short_open_tag'] = 'On'
default['php']['php_ini']['php']['serialize_precision'] = 100
default['php']['php_ini']['php']['realpath_cache_size'] = '512k'
default['php']['php_ini']['php']['realpath_cache_ttl'] = 84_600
default['php']['php_ini']['php']['expose_php'] = 'Off'
default['php']['php_ini']['php']['max_execution_time'] = 360
default['php']['php_ini']['php']['memory_limit'] = '2048M'
default['php']['php_ini']['php']['max_input_vars'] = 10_000
default['php']['php_ini']['php']['error_reporting'] = 'E_ALL & ~E_NOTICE | E_DEPRECATED'
default['php']['php_ini']['php']['html_errors'] = 'Off'
default['php']['php_ini']['php']['post_max_size'] = '64M'
default['php']['php_ini']['php']['upload_max_filesize'] = '64M'
default['php']['php_ini']['php']['allow_url_fopen'] = 'On'
default['php']['php_ini']['php']['html_errors'] = 'Off'
default['php']['php_ini']['date']['date.timezone'] = 'Europe/Berlin'
default['php']['php_ini']['session']['session.cookie_lifetime'] = 3_600
# default['php']['php_ini']['session']['session.save_handler'] = 'redis'
# default['php']['php_ini']['session']['session.save_path'] = 'tcp://0.0.0.0:6379'
default['php']['php_ini']['opcache']['opcache.enable'] = 1
default['php']['php_ini']['opcache']['opcache.revalidate_freq'] = 0
default['php']['php_ini']['opcache']['opcache.validate_timestamps'] = 1
default['php']['php_ini']['opcache']['opcache.memory_consumption'] = 2_048
default['php']['php_ini']['opcache']['opcache.interned_strings_buffer'] = 16
default['php']['php_ini']['opcache']['opcache.max_accelerated_files'] = 15_000
default['php']['php_ini']['opcache']['opcache.fast_shutdown'] = 1
default['php']['php_ini']['opcache']['opcache.save_comments'] = 1
default['php']['php_ini']['opcache']['opcache.enable_cli'] = 0

# compatibility
default['php']['ini']['directives']['global']['max_execution_time'] = node['php']['php_ini']['php']['max_execution_time']

default['php']['pear']['filename'] = 'go-pear.phar'
default['php']['pear']['download_url'] = 'http://pear.php.net/go-pear.phar'
default['php']['pear']['checksum'] = '3783740c4f2349919245abd756750f5879246b503c561659cc64489f0b43c582'

include_attribute 'php::ioncube'
include_attribute 'php::redis'
include_attribute 'php::opcache'
include_attribute 'php::xdebug'
include_attribute 'php::fpm'
