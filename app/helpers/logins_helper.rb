module LoginsHelper
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to (new_login_url), notice: "Por favor Ingrese a la Plataforma"
    end

  end
  def admin_user
    redirect_to(root_path) unless current_usuario.admin?
  end

  def sign_in(usuario)
    cookies.permanent[:remember_token] = usuario.remember_token #para generar el cookie de la sesión.
                                                                #por default el cookie expira 20.years.from_now
    self.current_user = usuario  #esto es lo que permite manipular current usuario en otras controles y redireccionar cambiar propiedadese etc

  end
  def signed_in?
    !current_usuario.nil?
  end

  def current_usuario=(usuario)
    @current_usuario = usuario
  end

  def current_usuario
    @current_usuario ||= Usuario.find_by_remember_token(cookies[:remember_token])
  end

  def current_usuario?(usuario)
     usuario == current_usuario
  end

  def sign_out
    self.current_usuario = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  def store_location
    session[:return_to] = request.url
  end
end

