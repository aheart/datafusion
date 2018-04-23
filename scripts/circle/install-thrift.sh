#!/usr/bin/env bash
#
# Install Apache Thrift

set -e

wget http://www-eu.apache.org/dist/thrift/0.11.0/thrift-0.11.0.tar.gz \
&& tar -xvf thrift-0.11.0.tar.gz \
&& cd thrift-0.11.0/ \
&& ./bootstrap.sh \
&& ./bootstrap.sh \
&& ./configure \
&& make \
&& make install \
&& thrift --version

