TESTING
=======

Bundler
-------
A ruby environment with Bundler installed is a prerequisite for using
the testing harness shipped with this cookbook. At the time of this
writing, it works with Ruby 2.0 and Bundler 1.5.3. All programs
involved, with the exception of Vagrant, can be installed by cd'ing
into the parent directory of this cookbook and running "bundle install"

Rakefile
--------
The Rakefile ships with a number of tasks, each of which can be ran
individually, or in groups. Typing "rake" by itself will perform style
checks with Rubocop and Foodcritic, ChefSpec with rspec, and
integration with Test Kitchen using the Vagrant driver by
default.Alternatively, integration tests can be ran with Test Kitchen
cloud drivers.

```
$ rake -T
rake integration:cloud    # Run Test Kitchen with cloud plugins
rake integration:vagrant  # Run Test Kitchen with Vagrant
rake spec                 # Run ChefSpec examples
rake style                # Run all style checks
rake style:chef           # Lint Chef cookbooks
rake style:ruby           # Run Ruby style checks
rake travis               # Run all tests on Travis
```

Style Testing
-------------
Ruby style tests can be performed by Rubocop by issuing either
```
bundle exec rubocop
```
or
```
rake style:ruby
```

Chef style tests can be performed with Foodcritic by issuing either
```
bundle exec foodcritic
```
or
```
rake style:chef
```

Spec Testing
-------------
Unit testing is done by running Rspec examples. Rspec will test any
libraries, then test recipes using ChefSpec. This works by compiling a
recipe (but not converging it), and allowing the user to make
assertions about the resource_collection.

Integration Testing
-------------------
Integration testing is performed by Test Kitchen. Test Kitchen will
use either the Vagrant driver or various cloud drivers to instantiate 
machines and apply cookbooks. After a successful converge, tests are
uploaded and ran out of band of Chef. Tests should be designed to
ensure that a recipe has accomplished its goal.

Integration Testing using Vagrant
---------------------------------
Integration tests can be performed on a local workstation using
Virtualbox or VMWare. Detailed instructions for setting this up can be
found at the [Vagrant](http://vagrantup.com) project web site.

Integration tests using Vagrant can be performed with either
```
bundle exec kitchen test
```
or
```
rake integration:vagrant
```

Integration Testing using Cloud providers
-----------------------------------------
Integration tests can be performed on cloud providers using
Test Kitchen plugins. This cookbook ships a ```.kitchen.cloud.yml```
that references environmental variables present in the shell that
```kitchen test``` is ran from. These usually contain authentication
tokens for driving IaaS APIs, as well as the paths to ssh private keys
needed for Test Kitchen log into them after they've been created.

Examples of environment variables being set in ```~/.bash_profile```:
```
# digital_ocean
export DIGITALOCEAN_ACCESS_TOKEN='your_bits_here'
export DIGITALOCEAN_SSH_KEY_IDS=['your_bits_here']
```

Integration tests using cloud drivers can be performed with either
```
export KITCHEN_YAML=.kitchen.cloud.yml
export TRAVIS=true
bundle exec kitchen test
```
or
```
export TRAVIS=true
rake integration:cloud
```

Digital Ocean Hint
------------------
At the time of this writing, you cannot find the numerical values
needed for your SSH_KEY_IDS from the GUI. Instead, you will need to
access the API from the command line.

    curl -X GET -H 'Content-Type: application/json' -H 'Authorization: Bearer YOUR_API_KEY' "https://api.digitalocean.com/v2/account/keys"

Words about .travis.yml
-----------------------
In order for Travis to perform integration tests on public cloud
providers, two major things need to happen. First, the environment
variables referenced by ```.kitchen.cloud.yml``` need to be made
available. Second, the private half of the ssh keys needed to log into
machines need to be dropped off on the machine.

The first part is straight forward. The travis gem can encrypt
environment variables against the public key on the Travis repository
and add them to the .travis.yml.

```
gem install travis
travis encrypt DIGITALOCEAN_ACCESS_TOKEN='your_bits_here' --add
travis encrypt DIGITALOCEAN_SSH_KEY_IDS=['your_bits_here'] --add
```

The second part is a little more complicated. Travis ENV variables are
restricted to 90 bytes, and will not fit an entire SSH key. This can
be worked around by breaking them up into 90 byte chunks, stashing
them into ENV variables, then digging them out in the
```before_install``` section of .travis.yml

Here is an AWK script to do the encoding.
```
base64 ~/.ssh/travis_id_do | \
awk '{
  j=0;
  for( i=1; i<length; i=i+90 ) {
    system("travis encrypt DO_KEY_CHUNK_" j "=" substr($0, i, 90) " --add");
    j++;
  }
}'
```
For simplicity you can run `./travis_encrypt.sh ~/.ssh/travis_id_do` from
within the project folder to encrypt all needed ENV variables at once.

Then in .travis.yml:
```
before_install:
- echo -n $DO_KEY_CHUNK_{0..30} >> ~/.ssh/id_do.base64
- cat ~/.ssh/id_do.base64 | tr -d ' ' | base64 --decode >  ~/.ssh/travis_id_do
```
