# CHANGELOG for dop_php

This file is used to list changes made in each version of dop_php.

## 2.0.8 (January 12, 2016)

* pin oauth version (stick to php5 compatibility) NOTE: there's already a php7 branch

## 2.0.7 (November 10, 2015)

* unpin xdebug version

## 2.0.6 (November 9, 2015)

* pin xdebug version

## 2.0.5 (October 27, 2015)

* fix compatibility to apt community cookbook

## 2.0.4 (July 9, 2015)

* fix not honoured only_if statements (falsly installs/activates xdebug)

## 2.0.3 (July 7, 2015)

* add php 5.6 option for ubuntu installs

## 2.0.2 (April 5, 2015)

* add redis, oauth, xdebug to php-cli

## 2.0.1 (January 22, 2015)

* update phpredis git repo url
* update test-suite

## 2.0.0 (November 22, 2014)

* Complete rewrite of dop_php

## 1.0.15 (July 19, 2014)

* compatibility with ubuntu

## 1.0.14 (July 15, 2014)

* add xdebug

## 1.0.13 (July 14, 2014)

* fix oauth and redis zend_extensions

## 1.0.12 (May 24, 2014)

* do not hardcode php5-fpm service notification

## 1.0.11 (May 23, 2014)

* correct opcache.revalidate_freq

## 1.0.10 (April 14, 2014)

* make sure redis is only listening on the loop-back interface 127.0.0.1

## 1.0.9  (April 8, 2014)

* switch to redisio 2.0 cookbook
* properly include directive to ioncube if applicable (must be in php.ini before [PHP] block)
* remove dependency to php::fpm and php::module_common
* raise default redis version to 2.8.8
* remove static redis log path (since redisio 2.0 can handle that now)
* remove dependency to dop_base at it is not needed

## 1.0.8  (March 7, 2014)

* raise php-fpm worker settings

## 1.0.7  (February 17, 2014)

* fix oauth recipe

## 1.0.6  (February 14, 2014)

* make oauth optional

## 1.0.5  (February 14, 2014)

* integrate recipe for installing [ioncube loaders](http://www.ioncube.com/loaders.php)

## 1.0.4  (February 7, 2014)

* fixes to run on Chef 11.10

## 1.0.3  (January 21, 2014)

* upgrade redis to 2.8.4

## 1.0.2  (December 6, 2013)

* upgrade redis to 2.8.2

## 1.0.1  (October 6, 2013)

* remove dependency to dop_nginx

## 1.0.0  (September 21, 2013)

* Initial release of dop_php