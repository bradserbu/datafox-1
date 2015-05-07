# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.



import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors import LinkExtractor
from chuangYePu.items import ChuangyepuItem

class chuangYePuSpider(CrawlSpider):
    name = 'itJuzi'
    allowed_domains = ["itjuzi.com"]
    start_urls = [
        "http://itjuzi.com/company"
    ]

    rules = [Rule(LinkExtractor(allow=['\/r\/\d+\/.*']), 'parse_company'), 
    Rule(LinkExtractor(allow=['\/category\/637\/index.*']))]
    # rules = [Rule(LinkExtractor(allow=['\/category\/637\/index.*']), 'add_url')]

    def parse_company(self, response):
        company = ItjuziItem()
        company['companyName'] = response.xpath("//div[@class='tzjg_jj_titlt']/h2/text()").extract()
        company['foundedIn'] = response.xpath("//ul[@class='hh']/li[1]/text()").extract()
        company['website'] = response.xpath("//ul[@class='hh']/li[2]/a/text()").extract()
        company['geoLocation'] = response.xpath("//ul[@class='hh']/li[3]/text()").extract()
        company['stage'] = response.xpath("//ul[@class='hh']/li[4]/text()").extract()
        company['industry'] = response.xpath("//ul[@class='hh']/li[5]/text()").extract()
        company['basicInfo'] = response.xpath("//div[@class ='tzj_jjg_txt']/p[1]/text()").extract()
        return company