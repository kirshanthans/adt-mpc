FROM ubuntu:18.04

# Set working directory
WORKDIR /root

# Install dependencies
RUN apt-get update && apt-get install -y \
  ocaml \
  libgcrypt20-dev \
  ocaml-findlib \
  ocamlbuild \
  opam \
  m4 \
  git \
  vim \
  gcc \
  make

# Install obliv-c
RUN git clone https://github.com/samee/obliv-c.git && \
    cd obliv-c && \
    ./configure && \
    make

RUN mkdir -p /root/test