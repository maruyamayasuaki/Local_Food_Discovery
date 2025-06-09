class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :localfood

  validates_uniqueness_of :localfood_id, scope: :user_id

end
