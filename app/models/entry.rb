class Entry < ActiveRecord::Base
  # Validations
  validates :user_id, presence: true
  validates :message_id, presence: true

  # Associations
  belongs_to :user
  belongs_to :message
  has_one :yelp_suggestion
end
