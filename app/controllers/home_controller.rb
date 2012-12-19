class HomeController < ApplicationController

  def index
  end

  def get_html
    url = params[:url]
    @html = HTTParty.get(url)

    img_tags = /<img.*?['"]([^'"]*)/m
    a_tags = /<a .*?href.*?['"]([^'"]*)['"].*?>\w*<\/a>/m

    @img_result = @html.scan(img_tags).flatten
    @a_result = @html.scan(a_tags).flatten

    binding.pry
  end


end