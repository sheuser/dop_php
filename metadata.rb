maintainer       "Achim Rosenhagen"
maintainer_email "a.rosenhagen@ffuenf.de"
license          "Apache 2.0"
description      "installs/configures dop_php"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             "dop_php"
version          "1.0.13"

%w{ debian }.each do |os|
  supports os
end

%w{ 
  git
  php
  redisio
}.each do |ressource|
  depends ressource
end