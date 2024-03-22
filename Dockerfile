FROM ubuntu:latest

RUN apt-get -y update && apt-get -y install \
sudo \
wget \
vim

WORKDIR opt

# install Anaconda3
RUN wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh && \
bash /opt/Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /opt/Anaconda3 && \
rm -f Anaconda3-2024.02-1-Linux-x86_64.sh

# set_path
ENV PATH /opt/Anaconda3/bin/:$PATH

RUN pip install --upgrade pip && pip install rdkit pymatgen

WORKDIR /
RUN mkdir /work

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "LabApp.token=''"]
