FROM ubuntu:18.04
MAINTAINER 4uuu Nya <i@qvq.im>

ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt update && apt dist-upgrade -y
RUN apt install -y build-essential autotools-dev libdumbnet-dev libluajit-5.1-dev libpcap-dev \
    zlib1g-dev pkg-config libhwloc-dev cmake liblzma-dev openssl libssl-dev cpputest libsqlite3-dev \
    libtool uuid-dev git autoconf bison flex libcmocka-dev libnetfilter-queue-dev libunwind-dev \
    libmnl-dev ethtool && apt clean

ADD ./docker/libsafec-02092020.tar.gz /docker/
WORKDIR /docker/libsafec-02092020.0-g6d921f
RUN ./configure && make && make install
ADD ./docker/pcre-8.44.tar.gz /docker/
WORKDIR /docker/pcre-8.44
RUN ./configure && make && make install
ADD /docker/gperftools-2.8.tar.gz /docker/
WORKDIR /docker/gperftools-2.8
RUN ./configure && make && make install
ADD /docker/ragel-6.10.tar.gz /docker/
WORKDIR /docker/ragel-6.10
RUN ./configure && make && make install
ADD ./docker/boost_1_74_0.tar.gz /docker/
ADD ./docker/hyperscan-5.3.0.tar.gz /docker/
WORKDIR /docker/hyperscan-5.3.0-build
RUN apt install python -y && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=/docker/boost_1_74_0/ ../hyperscan-5.3.0 && \
    make && make install
ADD ./docker/flatbuffers-v1.12.0.tar.gz /docker/
WORKDIR /docker/flatbuffers-build
RUN cmake ../flatbuffers-1.12.0 && make && make install
ADD ./docker/libdaq.tar.gz /docker/
WORKDIR /docker/libdaq
RUN ./bootstrap && ./configure && make && make install && ldconfig
ADD ./docker/snort3.tar.gz /docker/
WORKDIR /docker/snort3
RUN ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc --enable-large-pcap
WORKDIR /docker/snort3/build
RUN make && make install
RUN rm -rf /docker
WORKDIR /root
CMD tail -f /dev/null