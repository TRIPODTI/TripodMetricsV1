class UserMailer < ActionMailer::Base
  #default :from => 'jorgehernancardenas@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"

    mail(:to => 'jorgecardenas@tripod.net.co',:from => 'jorgehernancardenas@gmail.com')
  end
end
