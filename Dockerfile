FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
SHELL ["/bin/sh", "-c"]
RUN apk add --no-cache bash
ARG user=hakond
ARG home=/home/$user
RUN addgroup -S docker
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home $home \
    --ingroup docker \
    $user
WORKDIR $home
USER $user
COPY --chown=$user entrypoint.sh .
RUN chmod +x entrypoint.sh
COPY  --chown=$user cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["./entrypoint.sh"]
