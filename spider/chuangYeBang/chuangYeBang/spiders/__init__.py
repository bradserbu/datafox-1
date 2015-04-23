# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.


import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors import LinkExtractor
from chuangYeBang.items import ChuangyebangItem

class chuangYeBangSpider(CrawlSpider):
    name = 'chuangYeBang'
    allowed_domains = ["www.cyzone.cn"]
    start_urls = [
        "http://www.cyzone.cn/category/637/"
    ]

    rules = [Rule(LinkExtractor(allow=['\/r\/\d+\/.*']), 'parse_company')]

    def parse_company(self, response):
        company = ChuangyebangItem()
        company['companyName'] = response.xpath("//div[@class='tzjg_jj_titlt']/h2/text()").extract()
        company['foundedIn'] = response.xpath("//ul[@class='hh']/li[1]/text()").extract()
        company['website'] = response.xpath("//ul[@class='hh']/li[2]/a/text()").extract()
        company['geoLocation'] = response.xpath("//ul[@class='hh']/li[3]/text()").extract()
        company['stage'] = response.xpath("//ul[@class='hh']/li[4]/text()").extract()
        company['industry'] = response.xpath("//ul[@class='hh']/li[5]/text()").extract()
        # company['basicInfo'] = response.xpath
        return company