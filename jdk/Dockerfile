# A base docker image for the iColabora Java-based images, with Azul Zulu OpenJDK 8 installed.

FROM azul/zulu-openjdk-debian:8u131

MAINTAINER iColabora

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	&& rm -rf /var/lib/apt/lists/*
