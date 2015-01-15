class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notice_email(email)
    email = '838329367@qq.com'
    mail(to: email, subject:'Error Notice')
  end
end
