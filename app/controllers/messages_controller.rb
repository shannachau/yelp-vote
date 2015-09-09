class MessagesController < ApplicationController
  before_action :require_login

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
    user_ids = params[:message][:users]

    user_ids.each do |user_id|
      @message.users << User.find(user_id.to_i) unless user_id == ""
    end

    redirect_to messages_path
  end
end
