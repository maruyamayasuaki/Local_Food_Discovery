class ChangeTweetRefInLikes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :tweet, index: true, foreign_key: true
    add_reference :likes, :localfood, null: false, foreign_key: true

  end
end
