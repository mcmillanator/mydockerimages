FROM openjdk

WORKDIR /minecraft

ADD ./files/minecraft.jar .
ADD ./files/eula.txt .
RUN useradd minecraft \
		&& chown minecraft /minecraft

RUN rm -rf /var/log/*
USER minecraft

CMD	java --port 1337 -Xmx1024M -Xms1024M -jar minecraft.jar nogui
