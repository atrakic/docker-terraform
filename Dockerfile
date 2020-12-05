ARG TF_VERSION=0.14.0

FROM hashicorp/terraform:${TF_VERSION} as build

ARG BUILD_ID
ENV BUILD_ID=$BUILD_ID
LABEL build_version="Build:${BUILD_ID}"

ARG AWS_DEFAULT_REGION
ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

ARG AWS_ACCESS_KEY
ENV AWS_ACCESS_KEY=$AWS_ACCESS_KEY

ARG AWS_SECRET_ACCESS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1
RUN apk add --update bash git python3 py3-pip && \
  pip3 install boto3 awscli

WORKDIR /src/
RUN terraform version && terraform get 

ENTRYPOINT ["/bin/terraform"]
CMD ["version"]