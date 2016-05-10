FROM jupyter/scipy-notebook

MAINTAINER Jay <jaikumarm@yahoo.com>

USER root
RUN apt-get update && apt-get install -yq curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN curl -L http://downloads.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz > ta-lib-0.4.0-src.tar.gz &&\ 
	tar xvzf ta-lib-0.4.0-src.tar.gz && cd ta-lib && \
	./configure --prefix=/usr && \
	make && make install &&\
	rm ta-lib-0.4.0-src.tar.gz && rm -r ta-lib

USER jovyan

RUN conda install --quiet --yes -c jaikumarm \
	'theano=0.9.0.dev0' \
	'keras=1.0.2' \
	'hyperopt=0.0.3.dev' \
	'ta-lib=0.4.9' \
	&& conda clean -tipsy
	