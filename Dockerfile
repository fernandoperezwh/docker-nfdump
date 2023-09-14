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

# Clonamos el repositorio de nfdump desde GitHub
RUN git clone https://github.com/phaag/nfdump.git
RUN mkdir -p /app/flows
WORKDIR /nfdump

# Instalamos nfdump
RUN ./autogen.sh
RUN ./configure --disable-dependency-tracking
RUN make install
RUN ldconfig 

# Establecemos el directorio de trabajo por defecto
WORKDIR /

CMD ["bash"]
