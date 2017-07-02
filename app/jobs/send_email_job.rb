class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
        @user = user
    	ExampleMailer.sample_email(current_user).deliver_later
  end
end
