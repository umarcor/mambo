#! /bin/sh

set -e

cd $(dirname $0)/..

. "./travis/ansi_color.sh"

run="docker run --rm -itv $(pwd):/src"

printf "${ANSI_BLUE}make clean${ANSI_NOCOLOR}\n"
$run aptman/mambo:aarch64 make clean

printf "${ANSI_BLUE}make${ANSI_NOCOLOR}\n"
$run aptman/mambo:aarch64 make

printf "${ANSI_BLUE}make clean tests${ANSI_NOCOLOR}\n"
$run -w /src/test aptman/gcc:aarch64 make clean

printf "${ANSI_BLUE}make tests${ANSI_NOCOLOR}\n"
$run -w /src/test aptman/gcc:aarch64 make

#printf "${ANSI_BLUE}run tests${ANSI_NOCOLOR}\n"
#$run aptman/qemu ./dbm test/hw_div
#$run aptman/qemu:aarch64 ./dbm test/load_store
#$run aptman/qemu:aarch64 ./dbm test/mmap_munmap
#$run aptman/qemu:aarch64 ./dbm test/mprotect_exec
#$run aptman/qemu:aarch64 ./dbm test/self_modifying
#$run aptman/qemu:aarch64 ./dbm test/signals

printf "${ANSI_BLUE}make clean tests${ANSI_NOCOLOR}\n"
$run -w /src/test aptman/gcc:aarch64 make clean
