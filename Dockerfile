FROM netdata/netdata

# add config files that enable nvidia-smi collector
COPY /root/ /

# CUDA SETUP

# ensure that nvidia-smi is on the PATH
ENV PATH="/usr/local/nvidia/bin:${PATH}"

# https://github.com/sgerrand/alpine-pkg-glibc
ENV GLIBC_VERSION=2.31-r0
ENV LD_LIBRARY_PATH="/usr/local/nvidia/lib/:${LD_LIBRARY_PATH}"

RUN apk add ca-certificates \
    && cd /tmp \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk" \
    && apk --no-cache add "glibc-$GLIBC_VERSION.apk" \
    && rm "glibc-$GLIBC_VERSION.apk"
