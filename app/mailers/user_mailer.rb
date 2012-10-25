class UserMailer < ActionMailer::Base
  #default :from => 'jorgehernancardenas@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    @device = #device
    mail(:to => user.email,:from => 'notificaciones@tripod.net.co', :subject => "Notificacion Tripod Metrics" )
  end
end
