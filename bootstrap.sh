#!/usr/bin/env bash

sudo apt-get update

# need make to build redis
sudo apt-get install -y git ruby make supervisor

sudo gem install redis
