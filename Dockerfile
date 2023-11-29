FROM containers.mathworks.com/matlab-runtime:r2023a

# Copy the pipeline code. Matlab must be compiled before building. 
COPY build /opt/matlabtest/build
COPY bin /opt/matlabtest/bin
COPY src /opt/matlabtest/src

# Add pipeline to system path
ENV PATH=/opt/matlabtest/bin:${PATH}

ENV AGREE_TO_MATLAB_RUNTIME_LICENSE=yes
ENV MATLAB_RUNTIME=/opt/matlabruntime/R2023a
ENV MCR_INHIBIT_CTF_LOCK=1
ENV MCR_CACHE_ROOT=/tmp

# Matlab executable must be run at build to extract the CTF archive
RUN run_matlabtest.sh ${MATLAB_RUNTIME} quit

# Entrypoint
ENTRYPOINT ["run_matlabtest.sh","/opt/matlabruntime/R2023a"]
