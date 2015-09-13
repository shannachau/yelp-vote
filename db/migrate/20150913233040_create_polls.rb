class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :yes, default: 0
      t.integer :no, default: 0
      t.integer :yelp_suggestion_id, null: false

      t.timestamps null: false
    end
  end
end
