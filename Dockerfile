FROM continuumio/miniconda2
MAINTAINER Nick Waters <nickp60@gmail.com>
RUN apt-get update
RUN apt-get install build-essential ncbi-blast+ gzip unzip \
	 -y
RUN git clone https://github.com/nickp60/blobtools.git
WORKDIR blobtools
RUN apt-get install liblzma-dev  zlib1g-dev libbz2-dev  curl  libncurses-dev -y
RUN mkdir samtools && ln -s `which samtools` ./samtools/
RUN pip install pip==9.0
RUN ./install
RUN ./blobtools -h
# RUN ./blobtools create -i example/assembly.fna -b example/mapping_1.bam -t example/blast.out -o example/test
