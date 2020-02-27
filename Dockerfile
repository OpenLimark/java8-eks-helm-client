FROM openjdk:8-jdk-alpine

ENV KUBECONFIG="/opt/kubernetes/config"
ENV AWS_DEFAULT_REGION "us-west-2"

RUN apk --no-cache upgrade
RUN apk add --update bash ca-certificates git python

COPY install.sh /opt/install.sh
RUN /opt/install.sh
RUN mkdir -p /opt/kubernetes/
RUN mkdir -p /opt/helm/
ENV HELM_HOME /opt/helm/
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
COPY k8-config.template /k8-config.template
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
#CMD bash
