#
# Cookbook Name:: dop_php
# Recipe:: ioncube
#

src_filename = "#{node['php']['ioncube']['filename']}.tar.gz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/ioncube/#{node['php']['ioncube']['checksum']}"

remote_file src_filepath do
  source node['php']['ioncube']['download_url']
  checksum node['php']['ioncube']['checksum']
  owner 'root'
  group 'root'
  mode 00644
end

bash 'extract_ioncube' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    tar xvf #{src_filename} -C #{extract_path}
    mv #{extract_path}/ioncube #{node['php']['ioncube']['home']}
    echo '#{node['php']['ioncube']['checksum']}' > #{node['php']['ioncube']['home']}/VERSION
  EOH
  not_if "test `cat #{node['php']['ioncube']['home']}/VERSION` = #{node['php']['ioncube']['checksum']}"
  creates "#{node['php']['ioncube']['home']}/VERSION"
end

template "#{node['php']['ext_conf_dir']}/ioncube.ini" do
  source "zend_extension.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(:name => "#{node['php']['ioncube']['home']}/#{node['php']['ioncube']['version']}", :directives => [])
  not_if "php -m | grep ioncube"
end
