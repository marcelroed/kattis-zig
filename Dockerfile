FROM ubuntu:22.10

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Download links are listed here: https://ziglang.org/download/
# This should change to a stable release link as soon as 0.11 releases.
ARG zig_stem=zig-linux-x86_64-0.11.0-dev.4296+7e25fb4a4
ARG zig_filename=${zig_stem}.tar.xz
ARG zigurl=https://ziglang.org/builds/${zig_filename}

RUN apt-get update && apt-get upgrade -y

RUN \
    # Install `xz-utils` and `wget` to download and extract the zig archive
    apt-get install xz-utils -y &&\
    apt-get install wget -y &&\
    # Download archive
    wget ${zigurl} &&\
    # Extract zig + dependencies to the home directory
    tar xf ${zig_filename} --strip-components=1 &&\
    # Clean up archive file
    rm ${zig_filename}

# Can now run any zig command using `./zig`