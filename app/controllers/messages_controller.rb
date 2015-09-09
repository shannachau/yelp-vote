class MessagesController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    @messages = user.messages
  end

  def show
  end

  private

  def require_login
  end
end
