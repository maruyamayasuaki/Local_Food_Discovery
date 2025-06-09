class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      t.timestamps

      t.index [:user_id, :follow_id], unique: true

    end
  end
end
# Path: db/migrate/20240508113947_create_relationships.rb