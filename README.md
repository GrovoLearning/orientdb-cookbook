[![Build Status](https://travis-ci.org/fgimenez/orientdb-cookbook.png)](https://travis-ci.org/fgimenez/orientdb-cookbook)

OrientDB Cookbook
=================
This cookbook installs OrientDB (right now in single node mode)

Requirements
------------

It has been tested on Ubuntu 12.04, but should work on any platform where Java 1.6 works. 

The java and apt cookbooks are needed, as usual may be handled with Berkshelf. 


Attributes
----------
* node['orientdb']['user']['id']: User name
* node['orientdb']['version']: Database version
* node['orientdb']['flavour']: Flavour to be installed, now only community
* node['orientdb']['base_tarball_url']: Partial location of the tarball url, flavour, version and extension removed
* node['orientdb']['base_installation_directory']: Base install dir
* node['orientdb']['installation_directory']: Absolute install dir, dependent on the base install dir
* node['orientdb']['default_config_file']: Full path to tarball's server config file name
* node['orientdb']['default_init_script']: Full path to tarball's init script
* node['orientdb']['init_script']: Full path to actual init script
* node['orientdb']['db_user']: Admin DB user
* node['orientdb']['db_password']: Admin DB password

Running the tests
-----------------

For the unit tests just execute the default rake task:

    $ bundle install
    $ bundle exec rake

Run the integration tests through test kitchen:

    $ bundle exec kitchen test

Vagrant usage
-------------

For testing the cookbook with Vagrant 1.2+ you just have to execute bootstrap.sh:

    $ bootstrap.sh

It installs the required Vagrant plugins and launchs the machine. After the process you have a orientdb instance running in ```orientdb.local``` host, ip 33.33.33.33 (you may need to provide root privileges to allow vagrant-hostmanager do its duty).

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

License and Authors
-------------------
MIT License

Authors: Federico Gimenez Nieto <fgimenez@coit.es>

