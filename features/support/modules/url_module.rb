# -*- encoding : utf-8 -*-
# Wikidata UI tests
#
# Author:: Christoph Fischer (christoph.fischer@wikimedia.de)
# License:: GNU GPL v2+
#
# Reused and modified from https://github.com/wmde/WikidataBrowserTests/blob/master/tests/browser/features/support/modules/url_module.rb
#
# module for URLs

module URL
  def self.mediawiki_url()
    url = ENV["MEDIAWIKI_URL"]
    lang = ENV["MEDIAWIKI_LANGUAGE"]
    "http://#{lang}.#{url}"
  end

  def self.random_article_()
    url = ENV["MEDIAWIKI_URL"]
    lang = ENV["MEDIAWIKI_LANGUAGE"]
    "#{mediawiki_url}/wiki/Special:Random"
  end
end
