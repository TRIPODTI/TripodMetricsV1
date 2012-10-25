class LoginsController < ApplicationController

  def new
    render 'new'
  end

  def create

    usuario = Usuario.find_by_email(params[:login][:email].downcase)
    if usuario && usuario.authenticate( params[:login][:password])

      sign_in usuario
      redirect_back_or usuario

      #flash[:success]="Bienvenido a Tripod Metrics"
    else

      flash.now[:error] = 'Invalid email/password combination'
      #usar flash.now en lugar de flash solo, hace que el mensaje no replique en otras páginas.
      render 'new'
    end

  else

  end

  def destroy

    sign_out
    redirect_to root_url
  end


end
