class AddYelpSuggestionColumntoEntryModel < ActiveRecord::Migration
  def change
    add_column :entries, :yelp_suggestion, :boolean, default: false
  end
end
