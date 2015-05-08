# -*- coding: utf-8 -*-

# Scrapy settings for itJuzi project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'itJuzi'

SPIDER_MODULES = ['itJuzi.spiders']
NEWSPIDER_MODULE = 'itJuzi.spiders'


ITEM_PIPELINES = {'itJuzi.pipelines.ItjuziPipeline': 800,}

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'itJuzi (+http://www.yourdomain.com)'
