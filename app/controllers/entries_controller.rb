class EntriesController < ApplicationController
  def create
    entry = Entry.create(create_params)
    redirect_to message_path(entry.message_id)
  end

  private

  def create_params
    params.require(:entry).permit(:text, :user_id, :message_id)
  end
end
