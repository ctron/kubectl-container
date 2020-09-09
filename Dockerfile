FROM registry.access.redhat.com/ubi8-minimal

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
  && curl -sL -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
  && chmod a+x /usr/bin/kubectl

ENTRYPOINT [ "/usr/bin/kubectl" ]
