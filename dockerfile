FROM alpine:latest

# root user for Selenium
USER root

RUN apk update && \
	apk add python py-pip && \
	pip install selenium && \
	rm -f /var/cache/apk/*

RUN pip install docker-compose

RUN mkdir -p /root/selenium/tests

#copy entry_point.sh to /root/selenium. 

ADD entry_point.sh /root/selenium

ENV TARGET=http://13.94.254.116:3001/

RUN chmod 777 /root/selenium/entry_point.sh

CMD (cd /root/selenium; ./entry_point.sh $TARGET)
