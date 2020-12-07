class WelcomeMailer < ApplicationMailer
  #default from: 'jaylahari99@gmail.com'

  def send_welcome_mail(email)
 	mail(to: email, from: 'jaylahari99@gmail.com',

 		subject: 'test mail',message: 'Hello!!')
  end
end
