Description
===========

This cookbook is intended as wrapper-cookbook around the opscode community [php](https://github.com/opscode-cookbooks/php) cookbook when used as [dop](http://ffuenf.github.io/dop) component.

It essentially does the following adjustments:
* use sources from [dotdeb](http://www.dotdeb.org)
* use php-fpm
* installs [redis](http://www.redis.io) extensions ([phpredis](https://github.com/nicolasff/phpredis))
* optional: install ioncube loaders
* optional: install oauth

Requirements
============

Frameworks
---------
* [dop](http://ffuenf.github.io/dop)

Cookbooks
---------
* [dop_base](https://github.com/ffuenf/dop_base)
* [dop_php](https://github.com/ffuenf/dop_php)
* [dop_nginx](https://github.com/ffuenf/dop_nginx)
* [redisio](https://github.com/brianbianco/redisio)

License and Author
==================

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)

- Copyright:: 2013, ffuenf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.