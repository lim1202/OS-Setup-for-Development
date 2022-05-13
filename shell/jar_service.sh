#!/bin/sh

APP=$2

if [ "$1" = "" ];
then
    echo -e "\033[0;31m please input command name: \033[0m  \033[0;34m {start|stop|restart|status} \033[0m"
    exit 1
fi

if [ "$2" = "" ];
then
    echo -e "\033[0;31m please input jar name \033[0m"
    exit 1
fi

function start()
{
    COUNT=`ps -ef|grep java|grep $APP|grep -v grep|wc -l`
    if [ $COUNT != 0 ];then
        echo "$APP is running..."
    else
        echo "Starting $APP"
        nohup java -jar $APP > /dev/null 2>&1 &
        echo "Done."
    fi
}

function stop()
{
    COUNT=`ps -ef|grep java|grep $APP|grep -v grep|wc -l`
    if [ $COUNT != 0 ];then
        echo "Stopping $APP..."
        kill -9 `ps -ef|grep java|grep $APP|grep -v grep|awk '{print $2}'`
        echo "Done."
    else
        echo "$APP is not running..."
    fi
}

function restart()
{
    stop
    sleep 2
    start
}

function status()
{
    COUNT=`ps -ef|grep java|grep $APP|grep -v grep|wc -l`
    if [ $COUNT != 0 ];then
        echo "$APP is running..."
    else
        echo "$APP is not running..."
    fi
}

case $1 in
    start)
    start;;
    stop)
    stop;;
    restart)
    restart;;
    status)
    status;;
    *)

    echo -e "\033[0;31m Usage: \033[0m  \033[0;34m sh  $0  {start|stop|restart|status}  {Jar Name} \033[0m
\033[0;31m Example: \033[0m
      \033[0;33m sh  $0  start test.jar \033[0m"
esac
