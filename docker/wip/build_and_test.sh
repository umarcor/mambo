# !/bin/sh

git clone --recursive https://github.com/beehive-lab/mambo && cd mambo

docker run --rm -itv $(pwd):/src -w /src 11384eb/mambo:64-buster make

./dbm /bin/ls

docker run --rm -itv $(pwd):/src -w /src/test 11384eb/mambo:64-buster make

./dbm test/hw_div
./dbm test/load_store
./dbm test/mmap_munmap
./dbm test/mprotect_exec
./dbm test/self_modifying
./dbm test/signals
