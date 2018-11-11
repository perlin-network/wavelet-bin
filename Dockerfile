FROM ubuntu:18.04
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl libgmp-dev libbz2-dev libreadline-dev software-properties-common locales-all locales unzip screen

RUN curl -sSL https://github.com/perlin-network/wavelet-bin/releases/download/v0.0.1-testnet/wavelet-v0.0.1-testnet-linux-amd64.zip --output /tmp/wavelet-v0.0.1-testnet-linux-amd64.zip

RUN mkdir /usr/local/perlin
RUN cd /usr/local/perlin ; unzip /tmp/wavelet-v0.0.1-testnet-linux-amd64.zip

ENV PATH=$PATH:/root/.local/bin
RUN update-locale LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

WORKDIR /usr/local/perlin
CMD ["/bin/bash"]