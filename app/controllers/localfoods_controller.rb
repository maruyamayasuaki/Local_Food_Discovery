class LocalfoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search].present?
      # 部分検索
      @localfoods = Localfood.where("place LIKE ? ", '%' + params[:search] + '%')
    else
      @localfoods = Localfood.all
    end
    
    @localfoods = @localfoods.order(created_at: :desc).page(params[:page]).per(8)
  
    @rank_localfoods = Localfood.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    @rank_localfoods = Kaminari.paginate_array(@rank_localfoods).page(params[:rank_page]).per(8)
    # 営業時間の確認
    @localfoods.each do |localfood|
      localfood.fetch_opening_hours if localfood.google_place_id.present?
    end
    @user_time = Time.zone.now
  end

    def new
        @localfood = Localfood.new
    end

    def create
        localfood= Localfood.new(localfood_params)
            localfood.user_id = current_user.id
            if localfood.save
                redirect_to :action => "index"
            else
                redirect_to :action => "new"
            end
      end

      def show
        @localfood = Localfood.find(params[:id])
      end

      def edit
        @localfood = Localfood.find(params[:id])
      end
    
      def update
        localfood = Localfood.find(params[:id])
        if localfood.update(localfood_params)
          redirect_to :action => "show", :id => localfood.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        localfood = Localfood.find(params[:id])
        localfood.destroy
        redirect_to action: :index
      end
      
      def search
        query = params[:query]
        begin
          @localfoods = Localfood.where("place LIKE ?", "%#{query}%")
          render json: @localfoods.as_json(only: [:id, :place, :name])
        rescue => e
          logger.error "Search error: #{e.message}"
          render json: { error: e.message }, status: :internal_server_error
        end
      end

      private
      def localfood_params
        params.require(:localfood).permit(:shop, :place, :image, :price, :overall, :lat, :lng,:google_place_id, :price_range, meal_times: [])
      end
    

end
