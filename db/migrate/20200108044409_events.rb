class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :city
      t.string :country
      t.string :name
      t.string :content
      t.datetime :starts_at

      t.integer :rsvp_id
      t.integer :comment_id
    end
  end
end
