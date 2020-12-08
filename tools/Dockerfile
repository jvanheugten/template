# Use miniconda3 container image
FROM conda/miniconda3

# Set a default working directory
WORKDIR ./workdir

# Copy the repo to the WORKDIR
COPY . ./

RUN conda env create -n repo -f requirements.yml \
    && source activate repo \
    && echo "Conda env created and activated." \
    || echo "Failed creation and activation of Conda env."
