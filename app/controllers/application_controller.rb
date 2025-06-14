class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture_id, :city_id])
        # アカウント編集の時にnameとprofileのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :prefecture_id, :city_id])
    end

end

