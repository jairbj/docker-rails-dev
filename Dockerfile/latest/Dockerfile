FROM ubuntu:bionic
MAINTAINER Jair Junior

ENV DEFAULT_RUBY_VERSION 2.6.3
ENV DEFAULT_RAILS_VERSION 6.0.0.rc1

ENV WORKDIR /usr/src/app
ENV RVM_LOAD source /etc/profile.d/rvm.sh

ARG DEBIAN_FRONTEND=noninteractive

RUN echo BUILDING jairbj/rails-dev:latest

WORKDIR $WORKDIR
EXPOSE 3000
SHELL [ "/bin/bash", "-c" ]
RUN cd ~

# update packages
RUN apt-get update
# required to install rvm
RUN apt-get -y install gnupg2 curl
# required for install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
# required for rails 
RUN apt-get install -y libmysqlclient-dev libpq-dev libsqlite3-dev nodejs yarn ruby-tzinfo
# extra packages
RUN apt-get -y install git

# install rvm
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN $RVM_LOAD && rvm install $DEFAULT_RUBY_VERSION && rvm cleanup all
RUN $RVM_LOAD && gem install rails -v $DEFAULT_RAILS_VERSION

# change to default directory
RUN cd $WORKDIR

ENTRYPOINT ["/bin/bash", "-l"]