class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |e|
      e.string :city
      e.string :country
      e.string :name
      e.datetime :starts_at
      e.string :rsvp_id
    end
  end
end
