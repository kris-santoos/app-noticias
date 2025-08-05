require 'news-api'

class NewsApi
  def initialize
    @client = News.new(ENV['NEWS_API_KEY'])
  end

  def top_headlines(country: 'br', category: nil)
    @client.get_top_headlines(country: country, category: category)
  end

  def search_news(query)
    @client.get_everything(q: query)
  end
end
