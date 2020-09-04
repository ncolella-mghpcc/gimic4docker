FROM continuumio/miniconda2
USER root
RUN apt-get -m update && \
	apt-get install -y --no-install-recommends git ssh-client cmake make gfortran gcc g++ nano
RUN git config --global http.sslVerify false && \
	git clone https://github.com/qmcurrents/gimic /gimic && \
	cd gimic && \
	pip install -r requirements.txt && \
	./setup --omp && \
	cd build && \
	make && \
	make install && \
	cp /gimic/examples/benzene/3D/gimic.inp /gimic/tools/g092gimic
ENV PATH /gimic/build/bin:$PATH