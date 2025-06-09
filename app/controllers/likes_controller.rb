class LikesController < ApplicationController
  before_action :authenticate_user!
    def create
        like = current_user.likes.create(localfood_id: params[:localfood_id]) #user_idとlocalfood_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        like = Like.find_by(localfood_id: params[:localfood_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
end
