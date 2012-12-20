class HomeController < ApplicationController

  def index
  end

  def get_images
    url = params[:url]
    depth = params[:depth].to_i
    @html = HTTParty.get(url)

    crawler = Crawler.new
    images = crawler.get_image_urls(@html, url)
    links = crawler.get_link_urls(@html)

  end

end