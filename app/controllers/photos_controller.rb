class PhotosController < ApplicationController
  before_filter :make_the_user_login
  before_filter :make_the_user_login, :only => [:index, :create]
  before_filter :make_the_user_login, :except => [:show]
  
  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(self.params[:id])
    self.render('show', :layout => 'nonuser')
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo_data])
    #@photo.user_id = self.user_session[:user_session]
    @photo.save!
    self.redirect_to(site_root_url)
  end
  
  def destroy
    @photo.destroy
    flash[:update] = 'You have removed the photo.'
    redirect_back_or_default('/')   
  end
  
  def make_the_user_login
    self.redirect_to(signup_url) unless current_user_session
   end
end