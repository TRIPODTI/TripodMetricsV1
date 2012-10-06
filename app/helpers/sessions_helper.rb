module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token #para generar el cookie de la sesión.
    #por default el cookie expira 20.years.from_now
    self.current_user = user  #esto es lo que permite manipular current user en otras controles y redireccionar cambiar propiedadese etc

  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= Usuario.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
