# # # # #
# redis #
# # # # #
default['redisio']['mirror'] = "http://download.redis.io/releases"
default['redisio']['version'] = '2.8.2'
default['redisio']['servers'] = [
  {
    "name" => "master",
    "port" => "6379",
    "unixsocket" => "/var/run/redis/redis.sock",
    "unixsocketperm" => "755",
    "loglevel" => "notice"
  }
]

# # # # # #
# predis  #
# # # # # #
default['phpredis']['url'] = "git://github.com/nicolasff/phpredis.git"
default['phpredis']['revision'] = "master"