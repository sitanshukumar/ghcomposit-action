FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN addgroup -S sonargroup && adduser -S sonaruser -G sonargroup 
USER sonaruser


COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod 777 /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
