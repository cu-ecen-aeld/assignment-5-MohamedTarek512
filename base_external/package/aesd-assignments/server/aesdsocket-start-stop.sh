#!/bin/sh

DAEMON_PATH="/usr/bin"
DAEMON="aesdsocket"
DAEMON_OPTS="-d"

NAME="aesdsocket"
DESC="AESD Socket"
PIDFILE="/var/run/$NAME.pid"
SCRIPTNAME="/etc/init.d/$NAME"

start() {
    echo "Starting $DESC: $NAME"
    start-stop-daemon --start --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON_PATH/$DAEMON -- $DAEMON_OPTS
}

stop() {
    echo "Stopping $DESC: $NAME"
    start-stop-daemon --stop --pidfile $PIDFILE --retry 10
    rm -f $PIDFILE
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage: $SCRIPTNAME {start|stop|restart}" >&2
        exit 3
        ;;
esac

exit 0

