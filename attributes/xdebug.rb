# # # # # #
# xdebug  #
# # # # # #
default['php']['xdebug']['version'] = '2.4.0rc4'
default['php']['xdebug']['filename'] = "xdebug-#{node['php']['xdebug']['version']}"
default['php']['xdebug']['checksum'] = '55f8c906d8e7413c872e91db599082f18c3e49c736adf977333cd313fae635e8'
default['php']['xdebug']['download_url'] = "https://xdebug.org/files/#{node['php']['xdebug']['filename']}.tgz"

default['php']['xdebug']['enabled'] = false
default['php']['xdebug']['cli']['enabled'] = false

default['php']['xdebug']['ini']['auto_trace'] = 'Off'
default['php']['xdebug']['ini']['cli_color'] = '0'
default['php']['xdebug']['ini']['collect_assignments'] = 'Off'
default['php']['xdebug']['ini']['collect_includes'] = 'On'
default['php']['xdebug']['ini']['collect_params'] = '0'
default['php']['xdebug']['ini']['collect_return'] = 'Off'
default['php']['xdebug']['ini']['collect_vars'] = 'Off'
default['php']['xdebug']['ini']['coverage_enable'] = 'On'
default['php']['xdebug']['ini']['default_enable'] = 'On'
default['php']['xdebug']['ini']['dump.COOKIE'] = ''
default['php']['xdebug']['ini']['dump.ENV'] = ''
default['php']['xdebug']['ini']['dump.FILES'] = ''
default['php']['xdebug']['ini']['dump.GET'] = ''
default['php']['xdebug']['ini']['dump.POST'] = ''
default['php']['xdebug']['ini']['dump.REQUEST'] = ''
default['php']['xdebug']['ini']['dump.SERVER'] = ''
default['php']['xdebug']['ini']['dump.SESSION'] = ''
default['php']['xdebug']['ini']['dump_globals'] = 'On'
default['php']['xdebug']['ini']['dump_once'] = 'On'
default['php']['xdebug']['ini']['dump_undefined'] = 'Off'
default['php']['xdebug']['ini']['extended_info'] = 'On'
default['php']['xdebug']['ini']['file_link_format'] = ''
default['php']['xdebug']['ini']['idekey'] = ''
default['php']['xdebug']['ini']['max_nesting_level'] = '100'
default['php']['xdebug']['ini']['overload_var_dump'] = 'On'
default['php']['xdebug']['ini']['profiler_aggregate'] = 'Off'
default['php']['xdebug']['ini']['profiler_append'] = 'Off'
default['php']['xdebug']['ini']['profiler_enable'] = 'Off'
default['php']['xdebug']['ini']['profiler_enable_trigger'] = 'Off'
default['php']['xdebug']['ini']['profiler_output_dir'] = '/tmp'
default['php']['xdebug']['ini']['profiler_output_name'] = 'cachegrind.out.%p'
default['php']['xdebug']['ini']['remote_autostart'] = 'Off'
default['php']['xdebug']['ini']['remote_connect_back'] = 'Off'
default['php']['xdebug']['ini']['remote_cookie_expire_time'] = '3600'
default['php']['xdebug']['ini']['remote_enable'] = 'Off'
default['php']['xdebug']['ini']['remote_handler'] = 'dbgp'
default['php']['xdebug']['ini']['remote_host'] = 'localhost'
default['php']['xdebug']['ini']['remote_log_dir'] = '/var/log/xdebug'
default['php']['xdebug']['ini']['remote_log'] = "#{node['php']['xdebug']['ini']['remote_log_dir']}/xdebug_remote.log"
default['php']['xdebug']['ini']['remote_mode'] = 'req'
default['php']['xdebug']['ini']['remote_port'] = '9000'
default['php']['xdebug']['ini']['scream'] = 'Off'
default['php']['xdebug']['ini']['show_exception_trace'] = 'Off'
default['php']['xdebug']['ini']['show_local_vars'] = 'Off'
default['php']['xdebug']['ini']['show_mem_delta'] = 'Off'
default['php']['xdebug']['ini']['trace_enable_trigger'] = 'Off'
default['php']['xdebug']['ini']['trace_format'] = '0'
default['php']['xdebug']['ini']['trace_options'] = '0'
default['php']['xdebug']['ini']['trace_output_dir'] = '/tmp'
default['php']['xdebug']['ini']['trace_output_name'] = 'trace.%c'
default['php']['xdebug']['ini']['var_display_max_children'] = '128'
default['php']['xdebug']['ini']['var_display_max_data'] = '512'
default['php']['xdebug']['ini']['var_display_max_depth'] = '3'
