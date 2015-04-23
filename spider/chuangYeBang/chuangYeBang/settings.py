# -*- coding: utf-8 -*-

# Scrapy settings for chuangYeBang project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'chuangYeBang'

SPIDER_MODULES = ['chuangYeBang.spiders']
NEWSPIDER_MODULE = 'chuangYeBang.spiders'


ITEM_PIPELINES = {'chuangYeBang.pipelines.ChuangyebangPipeline': 800,}

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'chuangYeBang (+http://www.yourdomain.com)'
