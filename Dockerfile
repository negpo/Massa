FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install wget curl tar nano
COPY ./massa_start.sh ./
CMD sed -i 's/\r//' massa_start.sh && ./massa_start.sh 