#!/bin/bash
#
# Compile the matlab code so we can run it without a matlab license.

# Add Matlab to the path on the compilation machine
export MATLABROOT=~/MATLAB/R2023a
export PATH=${MATLABROOT}/bin:${PATH}

mcc -m -v ../src/matlabtest.m \
    -N \
    -a ../src \
    -d ../bin \
    -R '-startmsg,Starting Runtime' \
    -R '-completemsg,Completed runtime startup' \

# We grant lenient execute permissions to the matlab executable and runscript so
# we don't have hiccups later.
chmod go+rx ../bin/matlabtest
chmod go+rx ../bin/run_matlabtest.sh
