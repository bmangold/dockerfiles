FROM ubuntu:14.04

MAINTAINER Brandon Mangold <bmangold@docker.com>

RUN apt-get update && apt-get install -y \
  apache2-utils curl

ADD run_ab.sh .

ENTRYPOINT ["./run_ab.sh"]