#!/bin/bash

# Call getopt to validate the provided input. 
options=$(getopt -q -o hi:p:c:n:x: --long help,ip:,port:,context_path:,nthreads:,Xmx: -- "$@")

# if [ $? != 0 ] ; then echo "Incorrect options provided" >&2 ; exit 1 ; fi
# [ $? -eq 0 ] || { 
    # echo "Incorrect options provided"
    # exit 1
# }

eval set -- "$options"
while true; do
    case "$1" in
    -h|--help)
        echo "a java wrapper for h2o.jar"
        ;;
    -i|--ip)
        shift; # The arg is next in position args
        OPT_IP="-ip $1"
        ;;
    -p|--port)
        shift;
        OPT_PORT="-port $1"
        ;;
    -c|--context_path)
        shift;
        OPT_PATH="-context_path $1"
        ;;
    -n|--nthreads)
        shift;
        OPT_NTHREADS="-nthreads $1"
        ;;
    -x|--Xmx)
        shift; # e.g. -Xmx1g
        JVM_OPT_XMX="-Xmx$1"
        ;;
    --)
        shift;
        break
        ;;
    *)
        echo "$1 is not an option"
        ;;
    esac
    shift
done

for param in "$@"
do
    JAR_PATH="$1"
    break
done

# The arguments use the following format: java <JVM Options> -jar h2o.jar <H2O Options>.
java $JVM_OPT_XMX -jar $JAR_PATH $OPT_IP $OPT_PORT $OPT_PATH $OPT_NTHREADS


# echo "------"
# echo "$JAR_PATH"
# echo "------"
# echo "$OPT_IP, $OPT_PORT, $OPT_PATH, $OPT_NTHREADS"
# echo "------"
# echo "$JVM_OPT_XMX"

# test
# $ ./h2o.sh 1.jar --port=1234 --ip=12.32.32.32 --context_path=/home/ -x 2g b.jar --nthreads 2
# ------
# 1.jar
# ------
# -ip 12.32.32.32, -port 1234, -context_path /home/, -nthreads 2
# ------
# -Xmx2g
