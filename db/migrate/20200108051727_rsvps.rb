class Rsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.string :user_id
      t.string :event_id
    end
  end
end
