class Confirmation < ActionMailer::Base
  default from: "from@example.com"

  def receipt(user_confirmation)
    @user_confirmation = user_confirmation

    mail to: user_confirmation.email,
      subject: 'You Successfully Signed Up For Eros'
  end
end
