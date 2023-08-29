# Algolia DocSearch Scraper in Docker for GitHub Actions

Run self-hosted Algolia [DocSearch scraper](https://github.com/algolia/docsearch-scraper) in Docker with Github Actions

- The base image can make GitHub Actions workflow faster (less than 1 min image build time) and keep the scraper up-to-date automatically thanks to Docker Hub base image auto build
- You can get some config examples at [algolia/docsearch-configs](https://github.com/algolia/docsearch-configs)

## Usage

Basic usage:

```yaml
- name: Push indices to Algolia
  uses: signcl/docsearch-scraper-action@master
  env:
    APPLICATION_ID: ${{ secrets.ALGOLIA_APPLICATION_ID }}
    API_KEY: ${{ secrets.ALGOLIA_API_KEY }}
    CONFIG: '{"index_name": "docs","start_urls": ["https://example.com/"],"sitemap_urls": ["https://example.com/sitemap.xml"],"sitemap_alternate_links": true,"stop_urls": [],"selectors": {"lvl1": "header h1","lvl2": "article h2","lvl3": "article h3","lvl4": "article h4","lvl5": "article h5, article td:first-child","lvl6": "article h6","text": "article p, article li, article td:last-child"},"strip_chars": " .,;:#","custom_settings": {"separatorsToIndex": "_","attributesForFaceting": ["language","version","type","docusaurus_tag"],"attributesToRetrieve": ["hierarchy","content","anchor","url","url_without_anchor","type"]}}'
```

The tricky part is how to pass `CONFIG` to the scraper. The above example won't work if your configuration contains XPath select like `ul[contains(@class,'menu__list')]`. A more elegant way is committing your config as `algolia.json` into the repository and checkout within the workflow:

```yaml
- uses: actions/checkout@v2

- name: Get the content of algolia.json as config
  id: algolia_config
  run: echo "config=$(cat algolia.json | jq -r tostring)" >> $GITHUB_OUTPUT

- name: Push indices to Algolia
  uses: signcl/docsearch-scraper-action@master
  env:
    APPLICATION_ID: ${{ secrets.ALGOLIA_APPLICATION_ID }}
    API_KEY: ${{ secrets.ALGOLIA_API_KEY }}
    CONFIG: ${{ steps.algolia_config.outputs.config }}
```
