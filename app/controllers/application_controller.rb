class ApplicationController < ActionController::Base
  # devise使用時にメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の転送先を指定
  def after_sign_in_path_for(resource)
    # user_path(@user.id)
    user_path(resource)
  end

  protected
  def configure_permitted_parameters
    # ユーザ登録時にユーザ名(name) の操作を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    # ログイン時にユーザ名(name) の操作を許可する
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
