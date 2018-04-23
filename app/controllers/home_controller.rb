class HomeController < ApplicationController
  helper_method :news,

  def index
  end

  def news
    require 'rss'
    require 'open-uri'
    rss_results = []
    rss = RSS::Parser.parse(open('https://medium.com/feed/alturasoluciones').read, false).items[0..5]
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description, creator: result.dc_creator }
      rss_results.push(result)
    end
      return rss_results
  end
end
