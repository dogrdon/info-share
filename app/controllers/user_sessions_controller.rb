class UserSessionsController < ApplicationController
  
  
  def new
    @user_session = UserSession.new
    render('new', {:layout => 'sessions'})
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @user_session = current_user_session
      flash[:notice] = "Successfully logged in."
      redirect_to site_root_url
    else
      render('new', {:layout => 'sessions'})
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to site_root_url
  end
end
