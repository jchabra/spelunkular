class HomeController < ApplicationController

  def index
  end

  def get_html
    url = params[:url]
    @html = HTTParty.get(url)

    images = /<img.*?['"]([^'"]*)/m
    links = /<a .*?href.*?['"]([^'"]*)['"].*?>\w*<\/a>/m

    @images = @html.scan(images).flatten
    @links = @html.scan(links).flatten


  end


end