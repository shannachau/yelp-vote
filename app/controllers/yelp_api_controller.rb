require 'yelp_client'

class YelpApiController < ApplicationController
  def search
    @message = Message.find(params[:message_id])
    @entry = Entry.new
    @yelp_suggestion = YelpSuggestion.new

    if params[:search_term] && params[:location]
      response = Yelp.client.search(params[:location], { term: params[:search_term], limit: 10 })
    elsif params[:location]
      response = Yelp.client.search(params[:location], { limit: 10 })
    end

    @results = format_data(response)

    render :search
  end

  #  search for ajax
  # def search
  #   begin
  #     if params[:search_term] && params[:location]
  #       response = Yelp.client.search(params[:location], { term: params[:search_term], limit: 10 })
  #     elsif params[:location]
  #       response = Yelp.client.search(params[:location], { limit: 10 })
  #     end
  #
  #     data = format_data(response)
  #     code = :ok
  #   rescue
  #     data = {}
  #     code = :no_content
  #   end
  #   render json: data.as_json, code: code
  # end

  # # TODO: Not sure where to move this to? Need to write a route
  # def make_entry
  #   # will need user_id and message_id
  #   @message_id = params[:id]
  #   @user_id = session[:user_id]
  #   # wait can i even persist things to the database using jquery?!!
  #   data = { user_id: ,
  #            message_id: ,
  #            yelp_suggestion:
  #          }
  # end

  private

  def format_data(response)
    final_format = []
    response.businesses.each do |business|
      final_format.push(
        {
          name: business.name,
          url: business.url,
          image_url: business.image_url,
          rating_image: business.rating_img_url_small,
          location: business.location.display_address
        })
    end
    return final_format
  end
end
