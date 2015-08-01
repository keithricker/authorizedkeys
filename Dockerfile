FROM alpine 3.1
MAINTAINER support@tutum.co
ADD run.sh /
ENV AUTHORIZED_KEYS **None**
VOLUME /user
CMD ["/run.sh"]
