FROM sonarsource/sonar-scanner-cli:4.7
RUN apk add sudo
ARG NEWUSER='sonar'
RUN adduser -D -g "${NEWUSER}" $NEWUSER
RUN echo "$NEWUSER ALL=(ALL) ALL" > /etc/sudoers.d/$NEWUSER && chmod 777 /etc/sudoers.d/$NEWUSER


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
USER $NEWUSER
ENTRYPOINT ["/entrypoint.sh"]
