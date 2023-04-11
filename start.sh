#!/bin/bash
# Above or equal to 100, reserved are: 123 and 209
uid=${USER_ID:-1000}
gid=${GROUP_ID:-1000}
GROUP=${GROUP:-$USER}
deluser guest 2> /dev/null
echo "Adding user: $USER ($uid) and group: $GROUP ($gid)"
addgroup "$GROUP" -g $gid
adduser --gecos '' -u $uid -G "$GROUP" --home /home/ --disabled-password --shell /bin/bash $USER && \
    echo "${USER}:${PASSWORD}" | chpasswd
USER=""
PASSWORD=""
/usr/sbin/sshd -D
