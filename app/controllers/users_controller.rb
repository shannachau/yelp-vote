class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Try again!"
      render :new
    end
  end

  private

  def create_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
