FROM algolia/docsearch-scraper:latest

LABEL maintainer="t@sparanoid.com"

# Get rid of /github/home
# https://stackoverflow.com/a/63144407/412385
ENV WORKON_HOME /root
ENV PIPENV_PIPFILE /root/Pipfile

RUN pipenv install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
