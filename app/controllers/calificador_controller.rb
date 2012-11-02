class CalificadorController < ApplicationController
  require 'net/https'
  require 'open-uri'

  def calificador
    $usuario = Usuario.find(params[:id])

    @device= params[:device]
    @datetime = Time.now
    @date=@datetime.strftime("%d/%m/%Y")
    @time=@datetime.strftime("%H:%M:%S")

    if $usuario.service_type=="Personalizado"
      $logo=$usuario.url
    else
      $logo="Logo2.png"
    end

    if params[:excelente]
      url = URI.parse('http://tripod.net.co/create?rate[device_id]='+@device.to_s+'&rate[in_date]='+@date.to_s+'%20'+@time.to_s+'&rate[selected_option]=E')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end

    if params[:bueno]
      url = URI.parse('http://tripod.net.co/create?rate[device_id]='+@device.to_s+'&rate[in_date]='+@date.to_s+'%20'+@time.to_s+'&rate[selected_option]=E')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end
    if params[:regular]
      url = URI.parse('http://tripod.net.co/create?rate[device_id]='+@device.to_s+'&rate[in_date]='+@date.to_s+'%20'+@time.to_s+'&rate[selected_option]=E')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end
    if params[:malo]
      url = URI.parse('http://tripod.net.co/create?rate[device_id]='+@device.to_s+'&rate[in_date]='+@date.to_s+'%20'+@time.to_s+'&rate[selected_option]=E')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end

  end

  def pregunta
  end

  def personal


    if $usuario.service_type=="Personalizado"
      $logo=$usuario.url
    else
      $logo="Logo2.png"
    end
  end
end
