# Use miniconda3 container image
FROM conda/miniconda3

# Set a default working directory
WORKDIR ./workdir

# Copy the repo to the WORKDIR
COPY . ./

# Update conda to latest version
RUN conda update -y -n base -c defaults conda

# Create conda environment and install Python requirements
RUN conda env create -n repo -f requirements.yml \
    && echo "Conda env created successfully." \
    || echo "Failed creation of Conda env."
