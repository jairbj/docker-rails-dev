#!/bin/bash

#Load Versions
. rails-dev.versions

render() {
sedStr="
  s!%%TAG%%!$tag!g;  
  s!%%RAILS_VERSION%%!$rails!g;  
  s!%%RUBY_VERSION%%!$ruby!g;
  s!%%UBUNTU_IMAGE%%!$ubuntu!g;
"

sed -r "$sedStr" $1
}

for i in ${!tags[*]}; do  
  tag=${tags[i]}
  rails=${rails_v[i]}
  ruby=${ruby_v[i]}
  ubuntu=${ubuntu_v[i]}

  dir=Dockerfile/$tag
  mkdir -p $dir
  render Dockerfile.template > $dir/Dockerfile
done