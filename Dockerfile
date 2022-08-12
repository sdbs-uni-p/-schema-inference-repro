# Reproduction package for the paper Extracting JSON Schemas with Tagged Unions 
# by Stefan Klessinger, Meike Klettke, Uta Störl and Stefanie Scherzinger.
#
# Copyright 2022, Stefan Klessinger <stefan.klessinger@uni-passau.de>
# SPDX-License-Identifier: Apache-2.0

FROM ubuntu:20.04

LABEL maintainer="Stefan Klessinger <stefan.klessinger@uni-passau.de>"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

# Install packages for experiments
RUN apt-get update && apt-get install -y --no-install-recommends \
        dos2unix \
        git \
        pipenv \
        python3.9 \
        sudo \
        wget

# Add user
RUN useradd -m -G sudo -s /bin/bash repro && echo "repro:repro" | chpasswd
RUN usermod -a -G staff repro
USER repro
WORKDIR /home/repro

RUN git clone --single-branch -b deco https://github.com/sdbs-uni-p/Tagger implementation

# Add artifacts directory (from host) to home directory
ADD --chown=repro:repro artifacts/ /home/repro

RUN dos2unix *.sh
RUN chmod +x *.sh
RUN ./get_inputs.sh
RUN dos2unix input/*/*.json
WORKDIR /home/repro/implementation
RUN dos2unix *.py
RUN pipenv install
WORKDIR /home/repro
