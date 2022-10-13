FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN apk add --no-cache shadow
ARG USERNAME=sonar
ARG USER_UID=1001
ARG USER_GID=$USER_UID
RUN adduser $USERNAME
RUN addgroup -S $USERNAME
RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME
USER $USERNAME
COPY entrypoint.sh $home/entrypoint.sh
RUN chmod 777 $home/entrypoint.sh
COPY cleanup.sh $home//cleanup.sh .
RUN chmod 777 $home//cleanup.sh
ENTRYPOINT ["$home/entrypoint.sh"]
