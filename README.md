# JLab: Cinematographic Data Science

## Overview

This repo intends to make *getting started* with cinematographic data science (CDS) easy,
by maintaining a working toolchain of useful programs.

CDS is a catch-all term for analyzing, generating, and transforming cinematic data.
This includes but is not limited to:

1. color science
1. image formats, compression, and encoding
1. high dynamic range

## Architecture

We maintain a Docker image with a large toolset of useful programs.
You can access the image however you like,
but we assume most people will use the included Jupyter notebook server.

## Local Install

These directions are tailored towards a general audience.

### Pre-Requisites

Install the following applications onto your computer.

1. [Docker](https://docs.docker.com/get-docker/)
1. [Visual Studio Code](https://code.visualstudio.com/)
1. [GitHub Desktop](https://desktop.github.com/) or another Git Client.

### JLab

1. Use GitHub Desktop to download [JakeGWater/JLab](https://github.com/JakeGWater/JLab.git).
1. Open the project using Visual Studio Code.
1. Create a new terminal, and type `./scripts/start` to start the server.
1. Navigate to `http://localhost:8888`

## Development

1. To build a local Docker image:

	1. Download ~500mb of OCIO data: type `make download-ocio`

	1. Type `make build`

1. To delete all temporary data, including the docker image: type `make clean`

The start script will use the `jlab` docker image by default.
