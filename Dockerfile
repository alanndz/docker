FROM ubuntu:latest
LABEL maintainer "alanndz <alanndz@qmail.id>"

# Indonesian Timezone (GMT+8)
ENV TZ=Asia/Makassar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        bc \
	bison \
	ca-certificates \
	curl \
	flex \
	gcc \
	git \
	libc6-dev \
	libssl-dev \
	make \
	openssl \
	python \
	ssh \
	wget \
	zip \
	zstd
        
