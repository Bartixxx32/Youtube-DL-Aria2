FROM alpine:edge
RUN uname -ar > /uname.build
RUN apk add gcc g++ make libffi-dev openssl-dev
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
RUN apk update ; apk upgrade ; apk add --no-cache aria2 ffmpeg
RUN pip3 install yt-dlp
COPY yt_dl-docker.sh .
RUN chmod +x yt_dl-docker.sh
ENTRYPOINT ["sh", "yt_dl-docker.sh"]

