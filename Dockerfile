FROM alpine:3.20 AS build
ARG HUGO_VERSION=0.128.0
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -xf hugo.tar.gz && \
    mv hugo /usr/local/bin/
COPY . /opt/code
RUN hugo -s /opt/code --cleanDestinationDir --minify

FROM nginx:alpine
COPY --from=build /opt/code/public /usr/share/nginx/html
