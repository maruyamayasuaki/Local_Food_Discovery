class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :localfoods, dependent: :destroy
  validates :name, presence: true
  belongs_to :prefecture, optional: true
  belongs_to :city, optional: true
  
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :localfood
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  #follow機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :recommendations, dependent: :destroy
  has_many :recommended_tweets, through: :recommendations, source: :localfood

  def location
    "#{prefecture.name} #{city.name}"
  end

  def city_name
    city.name
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end




  def already_liked?(localfood)
    self.likes.exists?(localfood_id: localfood.id)
  end

  def already_recommendationed?(localfood)
    self.recommendations.exists?(localfood_id: localfood.id)
  end
end
