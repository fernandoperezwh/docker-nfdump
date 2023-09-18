FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
    git \
    pkg-config \
    build-essential \
    make \
    libtool \
    flex \
    bison \
    libbz2-dev
RUN apt-get clean

#
RUN git clone https://github.com/phaag/nfdump.git
RUN mkdir -p /app/flows
WORKDIR /nfdump

#
RUN ./autogen.sh
RUN ./configure --disable-dependency-tracking
RUN make install
RUN ldconfig 

WORKDIR /

CMD ["bash"]
