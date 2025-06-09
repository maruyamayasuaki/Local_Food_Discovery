class AddOverallToLocalfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :overall, :integer
  end
end
