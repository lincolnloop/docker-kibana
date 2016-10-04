FROM debian:jessie

ENV KIBANA_VERSION 4.6.1
ENV SHA1_SUM a8584824a22fca889e738a11839b690fe3db1b51


RUN apt-get update && apt-get install -y curl
WORKDIR /opt
RUN curl -sO https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-amd64.deb
RUN echo "${SHA1_SUM}  kibana-${KIBANA_VERSION}-amd64.deb" > kibana.sha1 && sha1sum --check kibana.sha1
RUN dpkg -i kibana-${KIBANA_VERSION}-amd64.deb && rm kibana-${KIBANA_VERSION}-amd64.deb

ADD run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
