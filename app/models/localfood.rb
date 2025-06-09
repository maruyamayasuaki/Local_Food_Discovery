require 'google_places'

class Localfood < ApplicationRecord
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_one_attached :image
    validates :shop, presence: true
    validates :place, presence: true
    validates :meal_times, presence: true
    has_many :recommendations
    has_many :recommended_by_users, through: :recommendations, source: :user

    def location
        "#{prefecture.name} #{city.name}"
    end

    def city_name
        place.split.first
    end

    # def fetch_opening_hours
    #     return if google_place_id.blank?
    
    #     client = GooglePlaces::Client.new(ENV['GOOGLE_MAP_API_KEY'])
    #     place = client.spot(google_place_id)
    #     self.opening_hours = place.opening_hours['weekday_text'].join(", ") if place.opening_hours
    #     save
    # end

    def fetch_opening_hours
        client = GooglePlaces::Client.new(ENV['GOOGLE_MAP_API_KEY'])
        place = client.spot(self.google_place_id)
        if place.opening_hours
            self.update(opening_hours: place.opening_hours['weekday_text'].join(", "))
        end
    end
end
