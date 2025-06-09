class AddGooglePlaceIdToLocalfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :google_place_id, :string
  end
end
