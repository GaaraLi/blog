class UserMailer < ActionMailer::Base
  default from: "361497565@qq.com"

  def notice_email(email)
    email = 'realwol@126.com'
    mail(to: email, subject:'Error Notice')
  end
end
