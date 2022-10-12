FROM sonarsource/sonar-scanner-cli:4.7
RUN apt-get -y update

LABEL maintainer Hitachivantara

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
