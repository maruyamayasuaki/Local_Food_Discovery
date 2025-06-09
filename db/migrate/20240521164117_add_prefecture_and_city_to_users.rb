class AddPrefectureAndCityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :prefecture_id, :integer
    add_column :users, :city_id, :integer
  end
end
