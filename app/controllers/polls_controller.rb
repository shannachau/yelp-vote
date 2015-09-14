class PollsController < ApplicationController
  before_action :find_poll, :find_message

  def yes
    @poll.yes = @poll.yes += 1
    @poll.save

    redirect_to message_path(@message)
  end

  def no
    @poll.no = @poll.no += 1
    @poll.save

    redirect_to message_path(@message)
  end

  private

  def find_poll
    @poll = YelpSuggestion.find(params[:yelp_suggestion_id]).poll
  end

  def find_message
    @message = YelpSuggestion.find(params[:yelp_suggestion_id]).entry.message
  end
end
