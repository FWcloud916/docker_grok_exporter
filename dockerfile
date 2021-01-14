FROM ubuntu:20.04
# grok_exporter-0.2.8.linux-amd64.zip
# https://github.com/fstab/grok_exporter/releases/download/v1.0.0.RC5/grok_exporter-1.0.0.RC5.linux-amd64.zip
ENV GROK_ARCH="grok_exporter-1.0.0.RC5.linux-amd64"
ENV GROK_VERSION="v1.0.0.RC5"


RUN apt-get update && \
    apt-get install -y wget unzip &&\
    wget https://github.com/fstab/grok_exporter/releases/download/$GROK_VERSION/$GROK_ARCH.zip &&\
    unzip $GROK_ARCH.zip && \
    mv $GROK_ARCH /grok && \
    rm $GROK_ARCH.zip && \
    mkdir -p /alloc/logs

WORKDIR /grok

COPY grok_config.yml /grok

EXPOSE 9144

CMD ["./grok_exporter", "-config", "/grok/grok_config.yml"]