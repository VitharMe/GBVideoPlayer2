FROM debian

MAINTAINER Vithar Me <vithar@vithar.me>

RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y --fix-missing \
    build-essential \
    git \
    flex \
    bison \
    pkg-config \
    wget \
    libpng-dev \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*
RUN git clone https://github.com/VitharMe/GBVideoPlayer2
RUN wget https://www.johnvansickle.com/ffmpeg/old-releases/ffmpeg-3.4.2-64bit-static.tar.xz && \
    wget https://github.com/gbdev/rgbds/releases/download/v0.3.7/rgbds-0.3.7.tar.gz
RUN tar xvf ffmpeg-3.4.2-64bit-static.tar.xz && \
    cp ffmpeg-3.4.2-64bit-static/ffmpeg /usr/local/bin/
RUN tar zxvf rgbds-0.3.7.tar.gz && \
    cd rgbds-0.3.7 && \
    make && \
    make install
WORKDIR /GBVideoPlayer2
COPY build.sh /GBVideoPlayer2/
RUN chmod +x build.sh
CMD ["./build.sh"]
