FROM registry.access.redhat.com/ubi8-minimal

# Install jq from EPEL, directly

RUN true \
  && curl -sSL http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/jq-1.5-12.el8.x86_64.rpm -o jq.rpm \
  && curl -sSL http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/oniguruma-6.8.2-1.el8.x86_64.rpm -o onig.rpm \
  && rpm -Uvh onig.rpm jq.rpm \
  && rm onig.rpm jq.rpm

ARG VERSION=latest

RUN true \
  && set -e \
  && set -o pipefail \
  && if [ $VERSION == "latest" ]; then \
    VERSION="$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)" ;\
  else \
    VERSION="v${VERSION}" ;\
  fi \
  && echo "Version: ${VERSION}" \
  && curl -sSL -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
  && chmod a+x /usr/bin/kubectl

ENTRYPOINT [ "/usr/bin/kubectl" ]
