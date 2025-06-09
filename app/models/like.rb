class Like < ApplicationRecord
  belongs_to :localfood
  belongs_to :user

  validates_uniqueness_of :localfood_id, scope: :user_id
end
