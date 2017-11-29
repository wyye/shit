FROM everware/base
USER root

RUN conda install -y conda=4.3.30
ADD environment.yml .
RUN conda env update --file environment.yml

USER jupyter

RUN wget https://cernbox.cern.ch/index.php/s/KdcvaDxND5J9zY2/download -O data-2016.tar

RUN tar xvf data-2016.tar

ADD jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py
ADD build_brick.ipynb .
EXPOSE 8888
