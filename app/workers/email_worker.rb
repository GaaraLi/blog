class EmailWorker
  include Sidekiq::Worker

  def perform
    UserMailer.notice_email('email').deliver
  end
end