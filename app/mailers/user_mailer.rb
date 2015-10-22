class UserMailer < ApplicationMailer
	default from: "me@gmail.com"

	def welcome_email(user)
		@user = user
 		@url = 'http://www.google.com'

    attachments["flow3.jpeg"] = File.read("#{Rails.root}/public/images/flow3.jpeg")
 		mail(:to => "jprathor8@mailinator.com", subject: 'my First mail') 		
	end

  def send_email(email)   
   @email = email.email
   @msg = 'success full send my message'

   mail(:to => "jprathor8@gmail.com", subject:"My Email to particular email id")
  end

end
