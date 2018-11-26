FROM alpine:edge

COPY testcafe.sh /bin/testcafe

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ upgrade  && \
    apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ add         \
    nodejs nodejs-npm chromium firefox xwininfo xvfb dbus eudev ttf-freefont fluxbox procps    \
    bash git openssh

RUN npm install -g testcafe testcafe-reporter-xunit                                         && \
 npm cache clean --force                                                                    && \
 rm -rf /tmp/*                                                                              && \
 chmod +x /bin/testcafe                                                                     && \
 adduser -D user

USER user

EXPOSE 1337 1338
