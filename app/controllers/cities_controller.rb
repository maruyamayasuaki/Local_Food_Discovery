class CitiesController < ApplicationController
    def index
        if params[:prefecture_id]
            @cities = City.where(prefecture_id: params[:prefecture_id])
            render json: @cities
        else
            @cities = City.all
            render json: @cities
        end
      end

end
