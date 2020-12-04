class Batch::SendDailyMail
  
  def self.send
    # ユーザ全員にデイリーメールを送信する
    users = User.all
    users.each do |user|
      DailyMailer.daily_email(user).deliver
    end
  end
  
end