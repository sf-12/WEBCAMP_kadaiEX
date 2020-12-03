# deviseのRegistrationsControllerをオーバーライド
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    # 親クラスを継承
    super
    # 新規登録成功時にメール送信
    if not @user.invalid?
      ThanksMailer.thanks_email(@user).deliver
    else
      p "aaaaaaaaaaaaaaaaaaaaaa"
      # render :new and return
      new_user_registration_path
    end
  end
end
