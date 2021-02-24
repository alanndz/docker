FROM ubuntu:latest
LABEL maintainer "alanndz <alanndz@qmail.id>"

# Indonesian Timezone (GMT+8)
ENV TZ=Asia/Makassar
ENV AOSP=/root/aosp
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        bc \
	bison \
	ca-certificates \
	curl \
        cpio \
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

# Clone Clang
RUN git clone --depth=1 https://github.com/sohamxda7/llvm-stable  $AOSP/clang

# Clone GCC
RUN git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc64 $AOSP/gcc
RUN git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc32 $AOSP/gcc32

# Clone Anykernel
RUN git clone -b lavender https://github.com/alanndz/AnyKernel3 /root/AnyKernel
