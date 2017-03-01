sudo apt-get update 

sudo apt-get --yes install make \
  m4 \
  gcc \
  git \
  unzip
  libncurses5-dev \
  autoconf \
  automake \
  libtool \
  g++ \
  libgflags-dev   \
  libsnappy-dev   \
  zlib1g-dev   \
  libbz2-dev   \

wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin

export PB_VERSION=3.1.0 && \
  wget https://github.com/google/protobuf/releases/download/v3.1.0/protobuf-cpp-$PB_VERSION.tar.gz && \
  tar xzvf protobuf-cpp-$PB_VERSION.tar.gz  && \
  cd protobuf-$PB_VERSION && \
  ./configure && \
  make && \
  make check && \
  sudo make install && \
  sudo ldconfig 

wget https://github.com/facebook/zstd/archive/v1.1.3.tar.gz  && \
  mv v1.1.3.tar.gz zstd-1.1.3.tar.gz  && \
  tar zxvf zstd-1.1.3.tar.gz  && \
  cd zstd-1.1.3  && \
  make && sudo make install 

export ROCKS_VERSION=4.13.5  && \
  wget https://github.com/facebook/rocksdb/archive/v$ROCKS_VERSION.tar.gz  && \
  tar xzvf v$ROCKS_VERSION.tar.gz   && \
  cd rocksdb-$ROCKS_VERSION/  && \
  make static_lib   && \
  sudo make install && \
  make share_lib   && \
  sudo make install
