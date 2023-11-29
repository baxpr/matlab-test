FROM containers.mathworks.com/matlab-runtime:r2023a

# Copy the pipeline code. Matlab must be compiled before building. 
COPY build /opt/matlabtest/build
COPY bin /opt/matlabtest/bin
COPY src /opt/matlabtest/src

# Add pipeline to system path
ENV PATH=/opt/matlabtest/bin:${PATH}

# Matlab executable must be run at build to extract the CTF archive
#RUN run_matlabtest.sh ${MATLAB_RUNTIME} quit

# Entrypoint
#ENTRYPOINT ["run_matlabtest.sh","/usr/local/MATLAB/MATLAB_Runtime/R2023a"]
