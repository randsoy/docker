FROM golang:1.15.6-buster

MAINTAINER FF  "lijun"

RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list
RUN sed -i 's#http://security.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    apt-utils \
    sudo \
    git \
    vim \
    unzip \
    xz-utils \
    autoconf \
		automake \
		bzip2 \
		dpkg-dev \
		file \
		g++ \
		gcc \
		imagemagick \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libdb-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libglib2.0-dev \
		libgmp-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libmaxminddb-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		unzip \
		xz-utils \
		zlib1g-dev \
		mercurial \
		openssh-client \
		subversion \
		procps \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/g' /etc/ssh/sshd_config
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN echo "export GOPROXY=https://goproxy.cn" >> /root/.bashrc
RUN echo "export PATH=/usr/local/go/bin:$PATH" >> /root/.bashrc
RUN echo "export GOLANG_VERSION=1.15.6" >> /root/.bashrc
RUN echo "export GOPATH=/go" >> /root/.bashrc
RUN echo "export PATH=$GOPATH/bin:$PATH" >> /root/.bashrc

ENV GOPROXY=https://goproxy.cn 
ENV PATH=/usr/local/go/bin:$PATH

RUN GO111MODULE=on GOPROXY=https://goproxy.io,direct go get -u github.com/golang/protobuf/protoc-gen-go





# RUN npm config set registry https://registry.npm.taobao.org &&\
#     npm install -g ts-protoc-gen 
# RUN echo "npm config set registry https://registry.npm.taobao.org" >> /root/.bashrc

# RUN npm install 

WORKDIR /usr/local/bin/
COPY tmp/bin/* .

VOLUME	["/data"]

EXPOSE 22

CMD	["/usr/sbin/sshd", "-D"]