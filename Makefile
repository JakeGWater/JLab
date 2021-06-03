#!/bin/bash

.phony: build help

NAME=jlab
OCIOZIP=cache/ocio
OCIOCONFIG=cache/ocio/OpenColorIO-Config-ACES-1.2/aces_1.2/config.ocio

define HELP_BODY
      ___  ___            __       _______   
     |"  ||"  |          /""\     |   _  "\  
     ||  |||  |         /    \    (. |_)  :) 
     |:  ||:  |        /' /\  \   |:     \/  
  ___|  /  \  |___    //  __'  \  (|  _  \\  
 /  :|_/ )( \_|:  \  /   /  \\  \ |: |_)  :) 
(_______/  \_______)(___/    \___)(_______/  

To start the notebook server, type `make start`

See README.md for more details.

endef

export HELP_BODY
help:
	@echo "$$HELP_BODY"

start:
	@scripts/start

build: $(OCIOCONFIG)
	docker build . -t $(NAME)

download-ocio: $(OCIOZIP).zip
	unzip -DD -o $(OCIOZIP).zip -d $(OCIOZIP)

$(OCIOZIP).zip:
	mkdir -p cache
	curl -L \
		-o $(OCIOZIP).zip \
		https://github.com/colour-science/OpenColorIO-Configs/releases/download/v1.2/OpenColorIO-Config-ACES-1.2.zip

clean:
	rm -rf cache
	rm -rf .jupyter .ipython .ipynb_checkpoints .local
	docker rmi -f $(NAME)
