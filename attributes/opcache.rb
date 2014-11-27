# # # # # #
# opcache #
# # # # # #
default['php']['ini']['directives']['opcache']['opcache.enable'] = 1
default['php']['ini']['directives']['opcache']['opcache.revalidate_freq'] = 0
default['php']['ini']['directives']['opcache']['opcache.memory_consumption'] = 2_048
default['php']['ini']['directives']['opcache']['opcache.interned_strings_buffer'] = 8
default['php']['ini']['directives']['opcache']['opcache.max_accelerated_files'] = 4_000
default['php']['ini']['directives']['opcache']['opcache.fast_shutdown'] = 1
default['php']['ini']['directives']['opcache']['opcache.save_comments'] = 1
default['php']['ini']['directives']['opcache']['opcache.enable_cli'] = 0
