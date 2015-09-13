class YelpSuggestion < ActiveRecord::Base
  belongs_to :entry
  has_one :poll
end
