#!/bin/bash
# 
# XXX: /bin/bash need to be on the first line to avoid exec format error 
# vim: filetype=sh
#


function on_error() {
  local frame=0

  echo "*******************************"
  echo "*** ERROR DETECTED ***"
  echo "$0"
  echo "----------------------"
  echo "Stack Trace Analysis"
  echo "----------------------"
  while caller $frame; do
	  ((frame++));
  done
  echo "$*"
  echo "*******************************"

  exit -1
}

# -E  If set, the ERR trap is inherited by shell functions.
set -E

trap 'on_error' ERR

bash -c "uname -a"
bash -c "stap --version"
bash -c "perf -h"
bash -c "java -version"
bash -c "javac -version"
bash -c "ls /workspace"

exec "$@"
