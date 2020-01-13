class Rsvps < ActiveRecord::Migration[6.0]
  def change
    
    create_table :rsvps do |t|
      t.datetime :created_at
      t.integer :user_id, index: true, foreign_key: true
      t.integer :event_id, index: true, foreign_key: true
    end
  end
end
