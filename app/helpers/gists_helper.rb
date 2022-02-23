module GistsHelper
  def url_hash(url)
    url.split('com/')[-1]
  end
end
