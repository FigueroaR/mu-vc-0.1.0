class Rsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.datetime :created_at
      t.integer :user_id
      t.integer :event_id
    end
  end
end
