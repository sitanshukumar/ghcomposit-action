FROM sonarsource/sonar-scanner-cli:4.7

LABEL version="1.1.0" \
      maintainer="SonarSource" 
RUN apk add sudo

# Create a group and user
RUN addgroup -S sonargrp && adduser -S sonar -G sonargrp

# Tell docker that all future commands should run as the sonar user
USER sonar
RUN chmod=rwx .

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY cleanup.sh /cleanup.sh
RUN chmod +x /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
