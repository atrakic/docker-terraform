FROM python:3.7-alpine 

WORKDIR /src

ADD requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

COPY --from=hashicorp/terraform:light /bin/terraform /usr/bin/terraform

VOLUME /src

RUN terraform get

ENTRYPOINT [ "terraform" ]
CMD [ "--help" ]
