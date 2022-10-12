FROM sonarsource/sonar-scanner-cli:4.7
# Add a new user "john" with user id 8877
RUN useradd -u 8877 sonar
# Change to non-root privilege
USER sonar
LABEL version="1.1.0" \
      maintainer="SonarSource" 
      


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
