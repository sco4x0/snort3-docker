#!/bin/bash

cd docker
wget https://github.com/rurban/safeclib/releases/download/v02092020/libsafec-02092020.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.8/gperftools-2.8.tar.gz
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
wget https://boostorg.jfrog.io/artifactory/main/release/1.74.0/source/boost_1_74_0.tar.gz
wget https://github.com/intel/hyperscan/archive/v5.3.0.tar.gz -O hyperscan-5.3.0.tar.gz
wget https://github.com/snort3/snort3/archive/refs/tags/3.1.0.0.tar.gz -O snort3.tar.gz
wget https://github.com/google/flatbuffers/archive/v1.12.0.tar.gz -O flatbuffers-v1.12.0.tar.gz
wget https://codeload.github.com/snort3/libdaq/tar.gz/refs/tags/v3.0.0 -O libdaq-3.0.0.tar.gz