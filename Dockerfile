FROM ubuntu:18.04

LABEL taidinfo="github.com/dimmarvel"

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    bsdmainutils \
    python3\
    libevent-dev \
    libboost-dev \
    libsqlite3-dev \
    libnatpmp-dev \
    libzmq3-dev \
    systemtap-sdt-dev \
    libqt5gui5 \
    libqt5core5a \
    libqt5dbus5 \
    qttools5-dev \
    qttools5-dev-tools \
    qtwayland5 \
    libqrencode-dev \
    libboost-all-dev \
    libssl-dev \
    wget \
    curl

RUN mkdir -p /usr/src/tide
WORKDIR /usr/src/tide

COPY . /usr/src/tide

RUN cd depends && make -j12

WORKDIR /usr/src/tide
RUN ./contrib/install_db4.sh `pwd`
RUN ./autogen.sh
RUN ./configure --prefix=$PWD/depends/x86_64-pc-linux-gnu BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" CXXFLAGS="-O2"
RUN make -j12