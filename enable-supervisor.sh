#!/usr/bin/env bash

# On Ubuntu 16.04 the installation of Supervisor does not
# enable and start the Supervisor daemon which breaks
# compatibility with previous Ubuntu releases.
# See https://bugs.launchpad.net/ubuntu/+source/supervisor/+bug/1594740
if [ $(lsb_release --short --codename) = xenial ]; then
  # Make sure the daemon is enabled.
  if ! systemctl --quiet is-enabled supervisor; then
    systemctl enable supervisor
  fi
  # Make sure the daemon is started.
  if ! systemctl --quiet is-active supervisor; then
    systemctl start supervisor
  fi
fi
