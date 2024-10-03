FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

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
RUN conda env create -f env.yaml

# Initialize bash with conda and add the environment activation to bashrc
# RUN /root/miniconda3/bin/conda init bash && \
#     echo "source /root/miniconda3/etc/profile.d/conda.sh && conda activate loopy-slam" >> /root/.bashrc

# HERE BELOW:

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

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

# Activate conda environment
RUN /root/miniconda3/bin/conda init bash && \
    echo "source /root/miniconda3/etc/profile.d/conda.sh && conda activate loopy-slam" >> /root/.bashrc

# RUN cd /home/PyDBoW3 && \
#     pip install .

# Set up working directory
WORKDIR /home/Loopy-SLAM


# Initialize bash with conda and add the environment activation to bashrc
# RUN /root/miniconda3/bin/conda init bash && \
#     echo "source /root/miniconda3/etc/profile.d/conda.sh && conda activate loopy-slam" >> /root/.bashrc

# Check Conda version
RUN conda --version

# Ensure that every new terminal will activate the conda environment
ENTRYPOINT ["bash", "-l"]