module DispositivosHelper

  def current_device
    @current_device = Dispositivo.find(params[:id])
  end


end
