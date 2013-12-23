# Base Ubuntu 12.04 Image
# Ruby, Jekyll
# outrunthewolf

# Base Docker File
FROM ubuntu:precise

# Maintainer
MAINTAINER outrunthewolf

# Check we've got the lastest distr
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Update the box
RUN apt-get update
RUN apt-get install -y build-essential curl zlib1g-dev

# Download the ruby-build code
RUN \curl -L https://github.com/sstephenson/ruby-build/archive/v20130518.tar.gz | tar -zxvf - -C /tmp/
 
# Install ruby-build
RUN cd /tmp/ruby-build-* && \
	./install.sh && \
	cd / && \ 
	rm -rfv /tmp/ruby-build-master
 
# Install ruby
RUN ruby-build -v 1.9.3-p429 /usr/local
 
# Install gems
RUN gem install rails

# install Jekyll
RUN gem install jekyll