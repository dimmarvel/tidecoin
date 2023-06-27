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
    libqrencode-dev

RUN mkdir -p /usr/src/tide
WORKDIR /usr/src/tide

COPY . /usr/src/tide