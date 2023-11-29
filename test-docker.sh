#!/usr/bin/env bash

docker run --read-only \
    --mount type=bind,src=$(pwd -P)/binds/tmp,dst=/tmp \
    baxterprogers/matlabtest:v0.0.0

exit 0

docker run --read-only \
    --mount type=bind,src=$(pwd -P)/binds/tmp,dst=/tmp \
    --mount type=bind,src=$(pwd -P)/binds/root,dst=/root \
    baxterprogers/matlabtest:v0.0.0
