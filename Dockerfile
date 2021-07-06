FROM openbayes/docsearch-scraper-action-base

LABEL maintainer="t@sparanoid.com"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
