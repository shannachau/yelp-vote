class AddYelpSuggestionColumntoEntryModel < ActiveRecord::Migration
  def change
    add_column :entries, :has_yelp_suggestion, :boolean, default: false
  end
end
