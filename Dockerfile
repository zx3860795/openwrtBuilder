FROM ubuntu:latest
MAINTAINER zhouxi 
ENV REFRESHED_AT 2019-11-22

# Var


# Copy depend file to container
#ADD ./dep/sources.list /home/

# Set enviroment var
#ENV PATH $PATH:$JAVA_HOME/bin

ENV DEBIAN_FRONTEND noninteractive

# New neoway source mount dir
RUN mkdir /home/zhouxi

# Change apt source after backup, only support ubuntu
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bkp
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list

RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

# Enable multi-architecture support
RUN dpkg --add-architecture i386

# Install software here

RUN apt-get -qq update
RUN apt-get -qq install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler antlr3 gperf
RUN apt-get -qq autoremove --purge
RUN apt-get -qq clean

WORKDIR /home/zhouxi
