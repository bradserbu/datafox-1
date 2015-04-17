# -*- coding: utf-8 -*-

# Scrapy settings for kr project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'kr'

SPIDER_MODULES = ['kr.spiders']
NEWSPIDER_MODULE = 'kr.spiders'

ITEM_PIPELINES = {'kr.pipelines.KrPipeline': 800,}


# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'kr (+http://www.yourdomain.com)'
