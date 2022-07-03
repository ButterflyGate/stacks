FROM postgres:14.4

RUN apt-get update -y && \
	apt-get install openssh-server -y
