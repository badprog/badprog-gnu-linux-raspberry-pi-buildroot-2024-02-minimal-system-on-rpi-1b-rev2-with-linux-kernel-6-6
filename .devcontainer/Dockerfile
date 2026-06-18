# badprog.com
FROM debian:bookworm-slim

ARG BUILDROOT_VERSION=2024.02.9
ARG BUILDROOT_URL=https://buildroot.org/downloads/buildroot-${BUILDROOT_VERSION}.tar.gz
ARG USERNAME=badprog
ARG WORKDIR_NAME=/workspaces/embedded-linux

RUN apt-get update && apt-get install -y \
    bc \
    binutils \
    build-essential \
    cpio \
    file \
    gcc \
    git \
    libncurses-dev \
    libssl-dev \
    make \
    python3 \
    rsync \
    unzip \
    tree \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -s /bin/bash $USERNAME

WORKDIR /opt
RUN wget -q ${BUILDROOT_URL} && \
    tar xf buildroot-${BUILDROOT_VERSION}.tar.gz && \
    mv buildroot-${BUILDROOT_VERSION} buildroot && \
    rm buildroot-${BUILDROOT_VERSION}.tar.gz && \
    chown -R $USERNAME:$USERNAME /opt/buildroot

RUN echo "alias l='ls -la'" >> /home/$USERNAME/.bashrc

RUN mkdir -p $WORKDIR_NAME && chown $USERNAME:$USERNAME $WORKDIR_NAME

USER $USERNAME

WORKDIR $WORKDIR_NAME

