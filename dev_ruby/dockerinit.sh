#!/bin/bash

# Change the UID based on volume, since we can't assume UID 1000 will match
# everyone's situation. This is especially not true for enterprise logins.
usermod -u $(stat -c '%u' /data) developer

# Automatically enter the mounted application root
cd /data

# Change to developer, spawn the command given
/usr/bin/su developer -c "$@"
