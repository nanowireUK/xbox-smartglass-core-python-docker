FROM python:slim-buster

RUN apt update
RUN apt install -y gcc libssl-dev libffi-dev locales

# Set the locale
RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN pip install xbox-smartglass-core

CMD ["xbox-rest-server","-b","0.0.0.0"]
