class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :text
      t.integer :user_id, null: false
      t.integer :message_id, null: false
      t.timestamps null: false
    end
  end
end
