class EmailWorker
  include Sidekiq::Worker
  # Forbidden the re-sending of email
  sidekiq_options retry: false


  def perform
    UserMailer.notice_email('email').deliver
  end
end