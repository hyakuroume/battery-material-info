FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim \
    libxau6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# install Anaconda3
RUN wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh && \
bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /opt/Anaconda3 && \
rm -f Anaconda3-2024.02-1-Linux-x86_64.sh

# set_path
ENV PATH /opt/Anaconda3/bin/:$PATH

# RUN pip install  psycopg2-binary rdkit pymatgen ma
RUN conda install -c  conda-forge -y pymatgen rdkit matminer mordred pydoe2 psycopg2-binary phonopy rdkit
# physbo skopt gpyopt

RUN pip install xenonpy deepchem

# RUN conda install -c  conda-forge -y mp_api

WORKDIR /

RUN mkdir /work

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

