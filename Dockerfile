FROM ubuntu

LABEL org.opencontainers.image.authors="jake.g.water@gmail.com"
LABEL version="1.0.0"
LABEL description="JLab Cinematographic Data Science Tools"

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ=America/Vancouver

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y\
    build-essential\
    curl\
    ffmpeg\
    giflib-tools\
    gzip\
    libgomp1\
    libheif1\
    libopencolorio1v5\
    libopencv-core4.2\
    libopenexr-dev\
    libopenimageio2.1\
    libopenjp2-7-dev\
    libraw19\
    libtiff5\
    opencolorio-tools\
    openexr\
    openimageio-tools\
    python3-opencv\
    python3-openimageio\
    python3-pip\
    python3-pyopencolorio\
    python3\
    sudo\
    webp\
    zip

# Add the OCIO Configs (downloaded as part of make build)
# https://github.com/colour-science/OpenColorIO-Configs/releases/tag/v1.2
ADD cache/ocio /ocio

# Pre-install all the wonderful python goodies
RUN pip install\
    colour-science\
    jupyter\
    matplotlib\
    numpy\
    openexr\
    Pillow\
    scipy

# Jupyter Setup
RUN useradd --home-dir /jupyter --create-home -G sudo jupyter
COPY jupyter /jupyter
USER jupyter
WORKDIR /jupyter
EXPOSE 8888/tcp

# Running Jupyter
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgomp.so.1:$LD_PRELOAD
ENV LD_PRELOAD=/lib/x86_64-linux-gnu/libjemalloc.so.2:$LD_PRELOAD
ENV OCIO=/ocio/OpenColorIO-Config-ACES-1.2/aces_1.2/config.ocio
CMD ["jupyter", "notebook"]
