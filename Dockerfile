FROM sonarsource/sonar-scanner-cli:4.7
RUN apk add sudo
ARG NEWUSER='sonar'
RUN adduser -g "${NEWUSER}" $NEWUSER
RUN echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 0440 /etc/sudoers.d/$NEWUSER
USER $NEWUSER

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
