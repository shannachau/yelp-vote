class CreateYelpSuggestions < ActiveRecord::Migration
  def change
    create_table :yelp_suggestions do |t|
      t.string :name
      t.string :url
      t.string :image_url
      t.string :rating_image
      t.string :location
      t.integer :entry_id, null: false
      t.timestamps null: false
    end
  end
end
