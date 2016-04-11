#!/bin/sh
echo "Hello, $(whoami)."
echo "Let's check ... " $1

# Works, but not very readable:
# lynx --dump  https://www.virustotal.com/en/file/$(sha256sum $1 | awk '{ print $1 }' )/analysis/ | grep Detection

# more readable:
MYHASH=$(sha256sum $1 | awk '{ print $1 }' )
echo $MYHASH
lynx --dump  https://www.virustotal.com/en/file/$MYHASH/analysis/ | grep Detection
