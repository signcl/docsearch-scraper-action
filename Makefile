all: build

build-base:
	docker build -f Dockerfile.base -t openbayes/docsearch-scraper-action-base:latest .

build:
	docker build -t openbayes/docsearch-scraper-action:latest .

run:
	docker run --rm -it --name docsearch-scraper-action openbayes/docsearch-scraper-action:latest

push-base:
	docker push openbayes/docsearch-scraper-action-base:latest

push:
	docker push openbayes/docsearch-scraper-action:latest

stop:
	docker rm -f docsearch-scraper-action

clean:
	docker rmi openbayes/docsearch-scraper-action:latest
