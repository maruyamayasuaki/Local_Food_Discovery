class RecommendationsController < ApplicationController
    before_action :authenticate_user!

    def create
        recommendation = current_user.recommendations.create(localfood_id: params[:localfood_id]) #user_idとlocalfood_idの二つを代入
        redirect_back(fallback_location: root_path)
    end

    def destroy
        recommendation = Recommendation.find_by(localfood_id: params[:localfood_id], user_id: current_user.id)
        recommendation.destroy
        redirect_back(fallback_location: root_path)
    end

end
