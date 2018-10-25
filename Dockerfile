FROM python:3.6.3-jessie

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


# This specifies where the current working
# directory is when we start copying files in.
WORKDIR /stage/allennlp

# Install base packages like gcc, git etc.
RUN apt-get update --fix-missing && apt-get install -y \
    bzip2 \
    ca-certificates \
    curl \
    gcc \
    git \
    libc-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    wget \
    libevent-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Optional argument to set an environment variable with the Git SHA
ARG SOURCE_COMMIT
ENV SOURCE_COMMIT $SOURCE_COMMIT

# This exposes port 8000 to outside of the Docker container.
# This is helful if you want to run a model server or something.
EXPOSE 8000

CMD ["/bin/bash"]
