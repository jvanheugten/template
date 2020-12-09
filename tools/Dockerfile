# Use miniconda3 container image
FROM conda/miniconda3

# For security update to latest package info
RUN apt-get -y update

# Update conda to latest version
RUN conda update -y -n base -c defaults conda

# Set a default working directory
WORKDIR ./workdir

# For Docker build efficiency,
# first only the conda requirements.yml is copied
COPY requirements.yml ./
ADD requirements ./requirements

# Create conda environment and install Python requirements
RUN conda env create -n repo -f requirements.yml \
    && echo "Conda env created successfully." \
    || echo "Failed creation of Conda env."

# Copy the rest of the repo to the WORKDIR
COPY . ./
