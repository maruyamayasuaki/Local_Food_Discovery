class AddMealTimesAndPriceRangeToLocalfood < ActiveRecord::Migration[6.1]
  def change
    add_column :localfoods, :meal_times, :string, default:"" 
    add_column :localfoods, :price_range, :string, default: "" # 配列ではないため空の文字列を設定します
  end
end


