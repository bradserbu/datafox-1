# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class LagouItem(scrapy.Item):
    companyName = scrapy.Field()
    foundedIn = scrapy.Field()
    website = scrapy.Field()
    geoLocation = scrapy.Field()
    stage = scrapy.Field()
    industry = scrapy.Field()
    basicInfo = scrapy.Field()
