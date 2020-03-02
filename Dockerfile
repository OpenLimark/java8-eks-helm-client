FROM jshimko/kube-tools-aws
RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8
RUN java -version
RUN mkdir /opt/home && chmod a+rw /opt/home
ENV HOME /opt/home 
ENV HELM_HOME /opt/home
