FROM centos:7

# core dependencies
RUN yum install -y make automake cmake gcc gcc-c++ gcc-gfortran blas-devel cmake lapack-devel bison flex fftw-devel suitesparse-devel epel-release \
&& rm -r /var/cache/yum/x86_64/7/*

# Paralel version

RUN yum install -y openmpi-devel metis-devel metis64-devel && rm -r /var/cache/yum/x86_64/7/*

ENV PATH=$PATH:/usr/lib64/openmpi/bin/
ENV XYCE_SRCDIR=/opt/Xyce/
ENV XYCE_OUTDIR=/usr/local/
WORKDIR $XYCE_SRCDIR

# Build parmetis
ENV PARMETIS_VERSION=4.0.3
RUN curl http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-${PARMETIS_VERSION}.tar.gz | gunzip | tar x && cd parmetis-${PARMETIS_VERSION} && \
make config prefix=$XYCE_OUTDIR && make && make install && cd ../ && rm -rf parmetis*

# Trilinos
ENV TRILINOS_VERSION=12.6.3
COPY ./reconfigure-parallel.sh ./reconfigure-parallel.sh
RUN mkdir Trilinos && cd Trilinos && curl -L https://github.com/trilinos/Trilinos/archive/trilinos-release-${TRILINOS_VERSION//./-}.tar.gz | \
tar xz && mv Trilinos-trilinos-release-${TRILINOS_VERSION//./-} trilinos-source && ../reconfigure-parallel.sh && make && make install && cd ../ && rm -rf Trilinos*

# Xyce
ENV XYCE_VERSION=6.7
COPY ./reconfigure-xyce.sh ./xyce-build/reconfigure-xyce.sh
RUN curl https://xyce.sandia.gov/downloads/_assets/documents/Xyce-${XYCE_VERSION}.tar.gz | tar xz && mv Xyce-${XYCE_VERSION} Xyce && cd xyce-build && \
./reconfigure-xyce.sh && make && make install && cd ../ && rm -rf Xyce xyce-build



