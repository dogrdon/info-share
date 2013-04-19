class UsersController < ApplicationController

  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    self.render('new', {:layout => 'newuser'})
    unless @user = current_user
      flash[:notice] = "Please signup or login to view that resource"
    end
  end
  
  
  def index
    @users = User.all
  end
  
  
  def create
    #raise self.params.inspect
    @user = User.new(params[:user])
    if @user.save!
      UserSession.create(@user)
      flash[:notice] = "Registration successful."
      self.render(:show)
    end
  end
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
    self.render(:edit)
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      if params[:user][:avatar].blank?
        flash[:notice] = "Successfully updated user profile."
        redirect_to show_user_url
      else
        render :action => 'edit'
      end
    end
  end
 
  def require_user
      self.redirect_to(signup_url) unless current_user_session
  end
end