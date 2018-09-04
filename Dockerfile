#
#
#
FROM ubuntu:18.04

###################################################################
# Install some basic pre-requisites
###################################################################
RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
    libc6-dev-i386 build-essential gcc g++ gfortran \
    python3-all-dev python3-pip python3-setuptools \
    git nodejs npm \
    libsm6 xserver-xorg && \
    apt-get -y clean

####################################################################
# Python requirements inc. jupyter and VTK
####################################################################
ADD requirements.txt /
RUN python3 -m pip install --upgrade pip && \
	python3 -m pip install -r requirements.txt

####################################################################
# Environment - make sure we pick up python and vtk
#
#  NOTE - at time of writing i cannot get it to self determine
#   	the python verison
#
####################################################################
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3.6/site-packages/"
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3.6/dist-packages/"
ENV LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/usr/local/lib/:/usr/local/lib/python3.6/dist-packages/:/usr/local/lib/python3.6/site-packages/"

####################################################################
# Jupyter Lab extension
####################################################################
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

####################################################################
# Build the local cirectory in the docker container
####################################################################
ADD . /jupyter-vtk-datawidgets
RUN cd /jupyter-vtk-datawidgets && \
	npm install webpack-node-externals --save-dev && \
	python3 -m pip install -e . -v 

# Notebook plugin build - this currently works
#RUN cd /jupyter-vtk-datawidgets && \
#	jupyter nbextension install --system --py vtkdatawidgets && \
#	jupyter nbextension enable --system --py vtkdatawidgets
	
# Lab extension - this does not work
RUN cd /jupyter-vtk-datawidgets && \
	jupyter labextension install .

####################################################################
# Set default shell to bash
####################################################################
ENV SHELL /bin/bash
RUN mkdir /host

####################################################################
# Default command starting jupyter lab 
####################################################################
CMD ["jupyter","lab","--ip=0.0.0.0","--allow-root"]
