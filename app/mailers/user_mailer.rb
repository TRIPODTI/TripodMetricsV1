class UserMailer < ActionMailer::Base
  #default :from => 'jorgehernancardenas@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
     @device= device
    mail(:to => 'jorgecardenas@tripod.net.co',:from => 'relacionescomerciales@tripod.net.co', :subject=> "Notificación Calificación Servicio" )
  end
end
