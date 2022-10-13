FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN adduser sonar
RUN  echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser sonar wheel
USER sonar

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
