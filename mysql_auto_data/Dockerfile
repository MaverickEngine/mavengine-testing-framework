FROM mariadb:latest

ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# Add sh script to scripts dir
ADD load_sql.sh /scripts/
RUN chmod +x /scripts/load_sql.sh
