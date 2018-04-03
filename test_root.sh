#!/bin/bash

if [ $UID -ne 0 ]; then
    echo No root user.
else
    echo Root user.
fi

