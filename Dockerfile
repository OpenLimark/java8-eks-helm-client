FROM jshimko/kube-tools-aws
RUN apk update && apk fetch openjdk8 && apk add openjdk8 && mkdir /opt/home && chmod a+rw /opt/home
ENV HOME /opt/home 
ENV HELM_HOME /opt/home
