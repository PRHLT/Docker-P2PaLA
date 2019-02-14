FROM conda/miniconda3
WORKDIR /app
COPY . ./
RUN apt-get update && apt-get install -y git libgl1-mesa-glx
RUN git clone https://github.com/lquirosd/P2PaLA.git
RUN /bin/bash -c "source /usr/local/bin/activate"
RUN conda install future numpy scipy
RUN conda install pytorch torchvision cudatoolkit=9.0 -c pytorch
RUN conda install -c conda-forge opencv
RUN pip install pyclipper
RUN conda clean --all
RUN cd P2PaLA && python setup.py install && cd .. 
CMD ["./run.sh"]
