class MessagesController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    @messages = user.messages
  end

  def show
    @message = Message.find(params[:id])
    @entry = Entry.new
  end

  def new
    @message = Message.new
    @users = User.all
  end

  def create
    @message = Message.create

    params[:message][:users].each do |user_id|
      @message.users << User.find(user_id.to_i)
    end

    redirect_to messages_path
  end

  private

  def require_login
  end
end
