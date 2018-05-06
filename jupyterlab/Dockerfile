FROM  python:3-slim-stretch

WORKDIR /opt/app/data

#RUN apk add --no-cache lapack-dev make cmake g++ gfortran libpng-dev freetype-dev libxml2-dev libxslt-dev
RUN apt-get update && apt-get -y install gfortran libblas-dev liblapack-dev && apt-get clean

RUN pip install jupyterlab jupyterlab-discovery
RUN jupyter serverextension enable --py jupyterlab --sys-prefix
RUN jupyter serverextension enable --sys-prefix jupyterlab_discovery

RUN pip install numpy matplotlib sympy
RUN pip install slycot control cite2c pandas

#RUN curl -O http://ftp.us.debian.org/debian/pool/non-free/n/ngspice/ngspice_27-1_amd64.deb\
#&& apt install  ./ngspice_27-1_amd64.deb \
#&& apt-get install -y \
RUN echo "deb http://deb.debian.org/debian stretch non-free" > /etc/apt/sources.list.d/backports.list \
&& apt-get update && apt-get install -y ngspice dvipng \
&& pip install pyspice &&  apt-get clean


RUN adduser jupyterlab --disabled-password --home /opt/app/data && chown -R jupyterlab: /opt/app/data

ENV pandoc_version 2.1.1

RUN apt-get install -y --no-install-recommends curl texlive-fonts-recommended  texlive-generic-recommended texlive-xetex texlive-publishers  \
&& apt-get clean \
&& curl -L https://github.com/jgm/pandoc/releases/download/${pandoc_version}/pandoc-${pandoc_version}-linux.tar.gz | \
tar xzv && mv pandoc-${pandoc_version}/bin/* /usr/local/bin/ && rm -r  pandoc-${pandoc_version}

USER jupyterlab
EXPOSE 8888
CMD jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data
