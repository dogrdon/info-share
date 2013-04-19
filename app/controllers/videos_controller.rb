class VideosController < ApplicationController
  ## self.layout('foo')
  before_filter :make_the_user_login
  before_filter :make_the_user_login, :only => [:index, :create]
  before_filter :make_the_user_login, :except => [:show]
  
  def index
    @videos = Video.all
  end
  
  def show
    @video = Video.find(self.params[:id])
    self.render('show', :layout => 'nonuser')
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video_data])
    @video.save!
    self.redirect_to(site_root_url)
  end
  
  def destroy
    @video.destroy
    flash[:update] = 'You have removed the video.'
    redirect_back_or_default('/')   
  end
  
  def make_the_user_login
      self.redirect_to(signup_url) unless current_user_session
  end
end