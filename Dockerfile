FROM ubuntu:20.04

RUN apt update && apt install -y python3 python3-pip

RUN mkdir -p /opt/mailoney
COPY . /opt/mailoney

WORKDIR /opt/mailoney

RUN /usr/bin/pip3 install -r requirements.txt

RUN mkdir -p /var/log/mailoney
RUN touch /var/log/mailoney/mailoney.json


VOLUME /var/log/mailoney

ENTRYPOINT ["/usr/bin/python3","mailoney.py","-i","0.0.0.0","-p","25","-t", "schizo_open_relay", "-logpath", "/var/log/mailoney", "-s","OpenSMTPD"]



