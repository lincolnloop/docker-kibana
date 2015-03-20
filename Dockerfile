FROM java:8

ENV KIBANA_VERSION 4.0.1
ENV MD5_SUM ae5019e3c36a03fc57a069c235ca97e4

WORKDIR /opt
RUN curl -O https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz
RUN echo "${MD5_SUM}  kibana-${KIBANA_VERSION}-linux-x64.tar.gz" > kibana.md5 && md5sum --check kibana.md5
RUN tar xzf kibana-${KIBANA_VERSION}-linux-x64.tar.gz && rm kibana-${KIBANA_VERSION}-linux-x64.tar.gz

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
