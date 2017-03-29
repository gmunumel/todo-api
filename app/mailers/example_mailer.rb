class ExampleMailer < ActionMailer::Base
  default from: 'n0dix1234@gmail.com'

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
