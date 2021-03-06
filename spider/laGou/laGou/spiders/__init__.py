# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.


import scrapy
from scrapy.contrib.spiders import CrawlSpider, Rule
from scrapy.contrib.linkextractors import LinkExtractor
from laGou.items import LaoGouItem

class laGouSpider(CrawlSpider):
    name = 'laGou'
    allowed_domains = ["www.lagou.com"]
    start_urls = [""]

    rules = [Rule(LinkExtractor(allow=['\/r\/\d+\/.*']), 'parse_company'), 
    Rule(LinkExtractor(allow=['\/category\/637\/index.*']))]

    def parse_company(self, response):
        company = ChuangyebangItem()
        company['companyName'] = response.xpath("//div[@class='tzjg_jj_titlt']/h2/text()").extract()
        company['foundedIn'] = response.xpath("//ul[@class='hh']/li[1]/text()").extract()
        company['website'] = response.xpath("//ul[@class='hh']/li[2]/a/text()").extract()
        company['geoLocation'] = response.xpath("//ul[@class='hh']/li[3]/text()").extract()
        company['stage'] = response.xpath("//ul[@class='hh']/li[4]/text()").extract()
        company['industry'] = response.xpath("//ul[@class='hh']/li[5]/text()").extract()
        company['basicInfo'] = response.xpath("//div[@class ='tzj_jjg_txt']/p[1]/text()").extract()
        return company
