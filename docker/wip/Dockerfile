FROM fedora:28

RUN dnf update -y && \
  dnf install -y 'dnf-command(copr)' && \
  dnf copr enable -y lantw44/aarch64-linux-gnu-toolchain && \
  dnf update -y && \
  dnf install -y curl make binutils gcc-aarch64-linux-gnu aarch64-linux-gnu-glibc && \
  curl -L http://www.mr511.de/software/libelf-0.8.13.tar.gz | tar xvz && \
  cd libelf-0.8.13 && \
  CC="aarch64-linux-gnu-gcc" CFLAGS="-static -O2" ./configure --target=aarch64 --prefix=/libelf-aarch64-static && \
  make && \
  make install

# https://rpmfind.net/linux/rpm2html/search.php?query=elfutils-libelf-devel-static