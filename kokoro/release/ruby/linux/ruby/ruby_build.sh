#!/bin/bash
set -e  # exit immediately on error
set -x  # display all commands

# Build protoc
if test ! -e src/protoc; then
  ./autogen.sh
  ./configure
  make -j4
fi

umask 0022
pushd ruby
bundle install && bundle exec rake gem:native
ls pkg
mv pkg/* $ARTIFACT_DIR
popd
