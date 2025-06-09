class AddOpeningHoursToLocalfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :opening_hours, :string
  end
end
