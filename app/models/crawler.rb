class Crawler

  def get_image_urls(html, url)
    regex = /<img.*?['"]([^'"]*)/m
    image_urls = html.scan(regex).flatten
    # clean_urls(image_urls, url)
    image_urls.each{ |link| Image.create(:image_url => link) }
  end

  def get_link_urls(html)
    regex = /<a .*?href.*?['"]([^'"]*)['"].*?>\w*<\/a>/m
    link_urls = html.scan(regex).flatten
  end

  def clean_urls(links, url)
    regex = /(https?:\/\/\w+[\.\w]+)/m
    url = url.scan(regex).flatten
    url = url[0]
    @new_links = []
    links.each do |link|
      if link[0..6] != "http://"
        @new_links << url + link
      else
        @new_links << link
      end
    end
  end

end