class AddColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :admin, :interger
  end
end
