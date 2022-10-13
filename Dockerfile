FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN apk add sudo
RUN NEWUSER='sonar'
RUN adduser -g "${NEWUSER}" $NEWUSER
RUN echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER
USER $NEWUSER

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod 777 /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
