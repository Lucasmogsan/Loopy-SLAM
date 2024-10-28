FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# Start shell in bash mode
SHELL ["/bin/bash", "-c"]
# Add Miniconda to PATH
ENV PATH="/root/miniconda3/bin:${PATH}"
# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install wget to fetch Miniconda
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda on x86 or ARM platforms
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"; \
    elif [ "$arch" = "aarch64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"; \
    else \
    echo "Unsupported architecture: $arch"; \
    exit 1; \
    fi && \
    wget $MINICONDA_URL -O miniconda.sh && \
    mkdir -p /root/.conda && \
    bash miniconda.sh -b -p /root/miniconda3 && \
    rm -f miniconda.sh

# Copy env.yaml file
COPY env.yaml .

# Set up conda environment
RUN conda update -y conda
RUN conda init && \
    conda env create -f env.yaml

# Initialize bash with conda and add the environment activation to bashrc
RUN /root/miniconda3/bin/conda init bash && \
    echo "source /root/miniconda3/etc/profile.d/conda.sh && conda activate loopy-slam" >> /root/.bashrc

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git cmake build-essential libopencv-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install additional git packages
WORKDIR /home
RUN git clone https://github.com/eriksandstroem/evaluate_3d_reconstruction_lib
RUN cd evaluate_3d_reconstruction_lib && \
    pip install .

WORKDIR /home
RUN git clone --recursive https://github.com/notchla/PyDBoW3.git

WORKDIR /home/PyDBoW3
RUN chmod +x dbow.sh && \
    ./dbow.sh

RUN source activate loopy-slam && \
    cd /home/PyDBoW3 && \
    pip install .

# Set up working directory
WORKDIR /home/Loopy-SLAM

# Log in to wandb
ENV WANDB_API_KEY=06fc375ce8e4c6e6a3ced49a30108bc17d4f8099
RUN wandb login

# Ensure that every new terminal will activate the conda environment
ENTRYPOINT ["bash", "-l"]