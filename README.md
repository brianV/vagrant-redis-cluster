Vagrant Redis Cluster
=====================

*Configures a redis cluster in vagrant*

This builds on the somewhat neglected 72squared Vagrant Redis Cluster at https://github.com/72squared/vagrant-redis-cluster.

The cluster is 6 redis instances running with 3 master & 3 slaves, one slave for each master.

This release currently installs Redis 3.2.5 from the official Redis repo (https://github.com/antirez/redis). To change this, update REDIS_VERSION in `redis_vars.sh`.

## Changes from the 72squared version

1. Uses [geerlingguy/ubuntu1604](https://vagrantcloud.com/geerlingguy/boxes/ubuntu1604) as the underlying Box
1. Forces '--cableconnected1=on' in VirtualBox.
1. Adds a provisioning script to start Supervisor automatically to work around https://bugs.launchpad.net/ubuntu/+source/supervisor/+bug/1594740
1. Downloads the Redis 3.2.5 release instead of the latest from the 3.0 branch. Changed the underlying mechanism to install tagged releases rather than a branch.
1. Makes Redis bind to 0.0.0.0 instead of 127.0.0.1 so we can access the Redis ports from outside the box.

## Setup
How to set up vagrant and start the cluster image.

1. Install [vagrant](http://www.vagrantup.com/)
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Clone the project locally: `git clone git@github.com:brianV/vagrant-redis-cluster.git`
1. Move into the project directory: `cd vagrant-redis-cluster`
1. Install the *vbguest* plugin: `vagrant plugin install vagrant-vbguest`
1. Provision the virtual machine using Vagrant: `vagrant up`
1. Make sure you have the Redis CLI installed: `brew install redis` (Mac)
1. Test the connection to verify everything is working: `redis-cli -p 7000` (or any other cluster port)

You should now have 6 redis servers running locally at:

* `127.0.0.1:7000`
* `127.0.0.1:7001`
* `127.0.0.1:7002`
* `127.0.0.1:7003`
* `127.0.0.1:7004`
* `127.0.0.1:7005`
