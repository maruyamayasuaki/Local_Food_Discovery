class AddUserIdToLocalfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :user_id, :integer
  end
end
