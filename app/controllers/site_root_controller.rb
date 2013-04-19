class SiteRootController < ApplicationController
  def index
    @videos = Video.all
    @photos = Photo.all
    @users = User.all
  end
end