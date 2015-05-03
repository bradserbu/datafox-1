# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors import LinkExtractor
from kr.items import KrItem

class KrSpider(CrawlSpider):
    name = "36kr"
    allowed_domains = ["36kr.com"]
    start_urls = [
        "http://36kr.com/search?page=1&q=",
        # "http://36kr.com/search?page=2&q="
    ]

    rules = [Rule(LinkExtractor(allow=['\/p\/\d+\.html\?utm_source=site_search']), 'parse_article'),
    Rule(LinkExtractor(allow=['\/search\?page=\d+.*']))]
    # rules = [Rule(LinkExtractor(allow=['\/search\?page=\d+.*']), 'parse_article')]

    def parse_article(self, response):
    	article = KrItem()
    	article['title'] = response.xpath("//h1[@class='single-post__title']/text()").extract()
        article['author'] = response.xpath("//div[@class='single-post__postmeta']/a/text()").extract()
        article['contents'] = response.xpath("//section[@class='article']/p/text()").extract()
        article['created_at'] = response.xpath("//time[@class='timeago']/@datetime").extract()
        article['url'] = response.url
        return article
