class CreateLocalfoods < ActiveRecord::Migration[6.1]
  def change
    create_table :localfoods do |t|
      t.string :shop
      t.text :place
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
