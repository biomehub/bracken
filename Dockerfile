FROM debian:latest
MAINTAINER lfelipedeoliveira, felipe@lfelipedeoliveira.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y; \
    apt-get install -y apt-utils

RUN apt-get install -y wget; \
    apt-get install -y git; \
    apt-get install -y zlib1g-dev; \
    apt-get install -y pkg-config libfreetype6-dev libpng-dev python-matplotlib; \
    apt-get install -y python-pip; \
    apt-get update; \
    apt-get clean

# Download & install Bracken

RUN git clone https://github.com/jenniferlu717/Bracken.git \
    && mkdir /opt/bracken  \
    && cd Bracken  \
    && sh install_bracken.sh \
    && cp bracken install_bracken.sh \
    && cp bracken-build install_bracken.sh \
    && cp src/generate_kmer_distribution.py /opt/bracken \
    && cp src/est_abundance.py /opt/bracken \
    && cp src/kmer2read_distr /opt/bracken \
    && cd .. \
    && rm -r Bracken

ENV PATH /opt/bracken/:$PATH
