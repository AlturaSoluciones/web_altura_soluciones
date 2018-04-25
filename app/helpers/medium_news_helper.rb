module MediumNewsHelper

  require 'rss'
  require 'open-uri'

  def medium_news
    rss = RSS::Parser.parse(open('https://medium.com/feed/alturasoluciones').read, false).items[0..6]
    rss.map{|article| {
        title: article.title, date: article.pubDate, link: article.link, description: article.description, creator: article.dc_creator
    }}
  end

end

