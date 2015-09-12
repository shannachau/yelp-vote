class YelpSuggestionsController < ApplicationController
  def create
    entry = Entry.create(entry_create_params)

    yelp_suggestion = YelpSuggestion.new
    yelp_suggestion.entry_id = entry.id
    yelp_suggestion.update(yelp_create_params)
    yelp_suggestion.save

    redirect_to message_path(entry.message)
  end

  private

  def entry_create_params
    params.require(:yelp_suggestion).permit(:text, :user_id, :message_id, :yelp_suggestion)
  end

  def yelp_create_params
    params.require(:yelp_suggestion).permit(:name, :url, :image_url, :rating_image, :location, :entry_id)
  end
end
