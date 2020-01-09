class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :city
      t.string :country
      t.string :name
      t.string :content
      t.string :start_time
      t.string :start_day
    end
  end
end

#t.datetime :starts_at