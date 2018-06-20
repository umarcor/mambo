#! /bin/sh

set -e

cd $(dirname $0)

. "../travis/ansi_color.sh"
. "../travis/utils.sh"
#disable_color

echo "travis_fold:start:gcc_aarch64"
travis_time_start
  printf "$ANSI_BLUE[DOCKER build] gcc:aarch64$ANSI_NOCOLOR\n"
  docker build -t aptman/gcc:aarch64 --target gcc-aarch64 - < dockerfiles/x86.aarch64.ubuntu18
travis_time_finish
echo "travis_fold:end:gcc_aarch64"

echo "travis_fold:start:mambo_aarch64"
travis_time_start
  printf "$ANSI_BLUE[DOCKER build] mambo:aarch64$ANSI_NOCOLOR\n"
  docker build -t aptman/mambo:aarch64 --target mambo-aarch64 - < dockerfiles/x86.aarch64.ubuntu18
travis_time_finish
echo "travis_fold:end:mambo_aarch64"

echo "travis_fold:start:qemu"
travis_time_start
  printf "$ANSI_BLUE[DOCKER build] qemu$ANSI_NOCOLOR\n"
  docker build -t aptman/qemu - < dockerfiles/x86.qemu.ubuntu18
travis_time_finish
echo "travis_fold:end:qemu"
