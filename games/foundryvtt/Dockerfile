FROM ubuntu:latest

RUN apt-get -qy update \
		&& apt-get -qy upgrade \
		&& apt-get install -y \
		wget \
		libssl-dev \
		unzip \
		curl \
		&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
		&& apt-get install -qy  \
			nodejs \
		&& apt-get autoremove \
		&& rm -rf /var/lib/apt/lists/*

WORKDIR /foundryvtt

ADD ./foundryvtt.zip .
RUN	unzip foundryvtt.zip \
		&& rm -rf foundryvtt.zip \
		&& useradd foundry \
		&& mkdir /foundrydata \
		&& chown foundry /foundrydata

RUN rm -rf /var/log/*
USER foundry

CMD	node resources/app/main.js --dataPath=/foundrydata
