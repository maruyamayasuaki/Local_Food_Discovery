class AddDetailsToLocalfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :lat, :float
    add_column :localfoods, :lng, :float
  end
end
