FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN useradd −u 8877 nonroot
RUN groupadd docker
RUN usermod −aG docker nonroot
USER nonroot

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod 777 /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
