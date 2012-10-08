class UserMailer < ActionMailer::Base
  #default :from => 'jorgehernancardenas@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    @device = #device
    mail(:to => 'jorgehernancardenas@hotmail.com',:from => 'relacionescomerciales@tripod.net.co', :subject => "Notificacion Tripod Metrics" )
  end
end
