FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-chrono-dev \
    libboost-program-options-dev \
    libboost-test-dev \
    libboost-thread-dev \
    libdb-dev \
    libdb++-dev \
    libminiupnpc-dev \
    libzmq3-dev \
    wget \
    curl \
    git \
    ca-certificates

COPY . /syscoin

RUN cd /syscoin && \ ./autogen.sh && \./configure --with-incompatible-bdb && \ make

WORKDIR /syscoin/src

EXPOSE 8332 8333

CMD ["./syscoind"]