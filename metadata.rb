maintainer       "Achim Rosenhagen"
maintainer_email "a.rosenhagen@ffuenf.de"
license          "Apache 2.0"
description      "installs/configures dop_php"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

%w{ debian }.each do |os|
  supports os
end

%w{ 
  dop_base
  dop_php
  dop_nginx
  redisio
}.each do |ressource|
  depends ressource
end