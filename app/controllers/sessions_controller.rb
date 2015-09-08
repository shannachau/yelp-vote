class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
    end

    redirect_to root_path
  end
end
