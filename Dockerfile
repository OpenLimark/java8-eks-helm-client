FROM openjdk:8-jdk-alpine

# FROM: https://aur.archlinux.org/packages/kubectl-bin/
ENV K8_VERSION="v1.14.0"
# FROM: https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.16.0"
ENV HEPTIO_AUTHENTICATOR_VERSION="0.3.0"

RUN apk add --no-cache ca-certificates bash git gnupg jq py-pip 
RUN apk add --update -t deps curl gettext 
RUN pip install awscli 
RUN curl -s -L https://storage.googleapis.com/kubernetes-release/release/${K8_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl 
RUN chmod +x /usr/local/bin/kubectl 
RUN curl -s -L https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xzO linux-amd64/helm > /usr/local/bin/helm 
RUN chmod +x /usr/local/bin/helm 
RUN curl -s -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${HEPTIO_AUTHENTICATOR_VERSION}/heptio-authenticator-aws_${HEPTIO_AUTHENTICATOR_VERSION}_linux_amd64 -o /usr/local/bin/aws-iam-authenticator 
RUN chmod +x /usr/local/bin/aws-iam-authenticator 
RUN rm -rf /var/cache/apk/* 

RUN mkdir -p /opt/kubernetes && chmod a+rwx /opt/kubernetes && mkdir -p /opt/helm && chmod a+rwx /opt/helm
ENV HELM_HOME="/opt/helm"
WORKDIR /
ADD . .
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
#CMD bash
