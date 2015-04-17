# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.
import scrapy

class DmozSpider(scrapy.Spider):
    name = "36kr"
    allowed_domains = ["36kr.com"]
    start_urls = [
        "http://36kr.com/columns/cn-startups",
    ]

    def parse(self, response):