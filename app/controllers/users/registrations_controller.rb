# deviseのRegistrationsControllerをオーバーライド
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    # 親クラスを継承
    super
    # 新規登録成功時にメール送信
    ThanksMailer.thanks_email(@user).deliver unless @user.invalid?
  end
end
