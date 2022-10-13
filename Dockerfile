FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
SHELL ["/bin/sh", "-c"]
RUN apk add --no-cache bash
ARG user=sonar
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
COPY entrypoint.sh $home/entrypoint.sh
RUN chmod +x $home/entrypoint.sh
COPY cleanup.sh $home//cleanup.sh .
RUN chmod +x $home//cleanup.sh
ENTRYPOINT ["$home/entrypoint.sh"]
