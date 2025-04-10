FROM ubuntu:latest

RUN apt update && apt install -y \
    wget \
    xxd \
    curl \
    gcc \
    g++ \
    make \
    libclang-dev \
    qemu-system \
    bash \
    git \
    build-essential \
    pkg-config \
    libssl-dev \
    libz-dev \
    libclang-dev


# 下载rust 然后安装 cargo-binutils 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN  bash -c "source $HOME/.cargo/env && cargo install cargo-binutils"


# install musl toolchains
RUN wget https://musl.cc/aarch64-linux-musl-cross.tgz && \
    wget https://musl.cc/riscv64-linux-musl-cross.tgz && \
    wget https://musl.cc/x86_64-linux-musl-cross.tgz && \
    tar zxf aarch64-linux-musl-cross.tgz && \
    tar zxf riscv64-linux-musl-cross.tgz && \
    tar zxf x86_64-linux-musl-cross.tgz

# 设置 musl 工具链的路径
RUN echo 'export PATH=`pwd`/x86_64-linux-musl-cross/bin:`pwd`/aarch64-linux-musl-cross/bin:`pwd`/riscv64-linux-musl-cross/bin:$PATH' >> ~/.bashrc
RUN  bash -c "source ~/.bashrc"

# 设置工作目录
WORKDIR /mnt/