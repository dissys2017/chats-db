FROM mysql:5.7

MAINTAINER Kris Kalavantavanich 

# Update and install git & vim
RUN apt-get update && apt-get install -y \
	vim

## Create app directory
WORKDIR /src

COPY . .

## Change \r\n to \n
RUN for f in ./*.sh; do tr -d '\r' < $f > $f; done

EXPOSE 3306

CMD /etc/init.d/mysql start && \
	/bin/bash import_sql.sh && \
	service mysql status && \
	/bin/bash 
