class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :localfood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
