#!/bin/sh

CONTAINER_NAME="challenge-shell-$RANDOM"

TIMEOUT="600" # 600 seconds = 10 minutes

(sleep "$TIMEOUT" ; echo "Out of time after $TIMEOUT seconds! Refresh to try again." ; docker stop $CONTAINER_NAME)& 

docker run -m 15M --cpu-quota 3000 --name "$CONTAINER_NAME" -it --rm busybox


