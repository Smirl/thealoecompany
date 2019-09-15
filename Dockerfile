FROM nginxinc/amplify-agent:1.4.1-1 as build
COPY . /opt/code
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.57.2/hugo_0.57.2_Linux-64bit.tar.gz && \
    tar -xvf hugo.tar.gz && \
    ./hugo -s /opt/code --cleanDestinationDir --minify

FROM nginxinc/amplify-agent:1.4.1-1
COPY --from=build /opt/code/public /usr/share/nginx/html
