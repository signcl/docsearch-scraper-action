FROM algolia/docsearch-scraper:latest
LABEL maintainer="t@sparanoid.com"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
