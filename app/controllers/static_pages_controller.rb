class StaticPagesController < ApplicationController
  def index
    Flickr.cache = "/tmp/flickr-api.yml"
    flickr = Flickr.new
    user_id = params[:user_id]
    if user_id
      @photo_urls = flickr.photos.search(user_id:).map { |photo| {url: Flickr.url(photo), url_photopage: Flickr.url_photopage(photo)} }
    end
  end
end
