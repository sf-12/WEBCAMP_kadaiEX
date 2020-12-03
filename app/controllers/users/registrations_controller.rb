# deviseのRegistrationsControllerをオーバーライド
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    # 親クラスを継承
    super
    
  end
end