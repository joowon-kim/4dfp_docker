#!/bin/sh

docker run -ti --rm \
    -v `pwd`:/data \
    4dfp $@

