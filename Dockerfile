FROM pytorch/pytorch
WORKDIR /workspace#
COPY . ./
RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN git clone https://github.com/lquirosd/P2PaLA.git
RUN /bin/bash -c "source activate"
RUN conda install -y scipy
RUN conda install -y -c conda-forge opencv
RUN pip install pyclipper
RUN conda clean --all -y
RUN cd P2PaLA && python setup.py install && cd .. 
CMD ["./run.sh"]
