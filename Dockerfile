FROM debian:jessie

ENV KIBANA_VERSION 4.1.1
ENV SHA1_SUM d43e039adcea43e1808229b9d55f3eaee6a5edb9


RUN apt-get update && apt-get install -y curl
WORKDIR /opt
RUN curl -sO https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz
RUN echo "${SHA1_SUM}  kibana-${KIBANA_VERSION}-linux-x64.tar.gz" > kibana.sha1 && sha1sum --check kibana.sha1
RUN tar xzf kibana-${KIBANA_VERSION}-linux-x64.tar.gz && rm kibana-${KIBANA_VERSION}-linux-x64.tar.gz

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
