class UserMailer < ActionMailer::Base
  #default :from => 'jorgehernancardenas@gmail.com'

  def notificacion(user, device)
    @user = user
    @url  = "http://example.com/login"
     @device= device
    mail(:to => 'jorgecardenas@tripod.net.co',:from => 'relacionescomerciales@tripod.net.co' )
  end
end
