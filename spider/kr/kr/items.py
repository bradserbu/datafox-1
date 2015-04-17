# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class KrItem(scrapy.Item):
    # define the fields for your item here like:
    category = scrapy.Field()
    title = scrapy.Field()
    author = scrapy.Field()
    date_created = scrapy.Field()
    contents = scrapy.Field()
    url = scrapy.Field()    
    desc = scrapy.Field()


