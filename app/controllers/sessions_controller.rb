class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new; end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
      flash[:danger] = 'User not found'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def login; end

  def welcome; end

  def page_requires_login; end
end
