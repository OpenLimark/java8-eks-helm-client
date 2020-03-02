FROM jshimko/kube-tools-aws
RUN mkdir /opt/home && chmod a+rw /opt/home
ENV HOME /opt/home 
ENV HELM_HOME /opt/home
