FROM ubuntu:latest
LABEL maintainer "alanndz <alanndz@qmail.id>"

# Indonesian Timezone (GMT+8)
ENV TZ=Asia/Makassar
ENV AOSP=/root/aosp
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        autoconf \
	autogen \
	automake \
	autotools-dev \
	bc \
	binutils \
	binutils-aarch64-linux-gnu \
	binutils-arm-linux-gnueabi \
	bison \
	bzip2 \
	ca-certificates \
	coreutils \
	cmake \
	curl \
        cpio \
	expect \
	flex \
	g++ \
	gawk \
	gcc \
	git \
	gnupg \
	gperf \
	help2man \
	lftp \
	libc6-dev \
	libelf-dev \
	libgomp1-* \
	liblz4-tool \
	libncurses5-dev \
	libssl-dev \
	libstdc++6 \
	libtool \
	libtool-bin \
	libtinfo5 \
	m4 \
	make \
	nano \
	openjdk-8-jdk \
	openssh-client \
	openssl \
	ovmf \
	patch \
	pigz \
	python3 \
	python2 \
	rsync \
	shtool \
	subversion \
	tar \
	texinfo \
	tzdata \
	u-boot-tools \
	unzip \
	wget \
	xz-utils \
	zip \
	zlib1g-dev \
	zstd
   
# Clone Sdclang 10.0.9
RUN git clone https://github.com/TRINKET-ANDROID/proprietary_vendor_qcom_sdclang -b ruby --depth=1 /root/sdclang-10

# Clone GCC
RUN git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc64 $AOSP/gcc
RUN git clone --depth=1 https://github.com/sohamxda7/llvm-stable -b gcc32 $AOSP/gcc32

# Clone Anykernel
RUN git clone -b lavender https://github.com/alanndz/AnyKernel3 /root/AnyKernel
