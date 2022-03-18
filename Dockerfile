#FROM amazon/aws-cli:latest AS aws-image
FROM quay.io/roboll/helmfile:v0.143.0

#COPY --from=aws-image /usr/local/bin/aws /usr/local/bin/aws

ENV AWSCLI_VERSION "1.20.7"

RUN apk add --update \
    python3 \
    python3-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade \
    && rm -rf /var/cache/apk/*

RUN aws --version

