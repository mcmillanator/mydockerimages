FROM ruby:latest
RUN gem install -Nq gemstash
RUN useradd gemstash -d /home/gemstash && \
    mkdir -p /home/gemstash && \
    chown -R gemstash /home/gemstash
USER gemstash
WORKDIR /home/gemstash
# default port 9292
CMD gemstash start && tail -f ~/.gemstash/server.log
