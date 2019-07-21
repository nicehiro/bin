#!/usr/bin/bash
# When DBus can't control spotify, execute this script & restart system.
# Copyed from arch spotify page.

USER=`whoami`
PROCESS=spotify
PID=`pgrep -o -u $USER $PROCESS`
ENVIRON=/proc/$PID/environ
if [ -e $ENVIRON ]
then
    export `grep -z DBUS_SESSION_BUS_ADDRESS $ENVIRON`
else
    echo "Unable to set DBUS_SESSION_BUS_ADDRESS."
    exit 1
fi
