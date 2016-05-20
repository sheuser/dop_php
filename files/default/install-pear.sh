#!/usr/bin/expect
spawn php ./go-pear.phar

expect "1-12, 'all' or Enter to continue:"
send "\r"
expect eof

spawn rm go-pear.phar