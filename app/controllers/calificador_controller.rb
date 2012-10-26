class CalificadorController < ApplicationController
  require 'net/https'
  require 'open-uri'

  def calificador
    $usuario = Usuario.find(params[:id])
    @device= params[:device]
    if $usuario.service_type=="Personalizado"
      $logo=$usuario.url
    else
      $logo="Logo2.png"
    end

    if params[:excelente]
      url = URI.parse('http://ec2-184-72-222-38.compute-1.amazonaws.comcreate?rate[device_id]='+@device+'&rate[in_date]=02/10/2012%2011:19:20&rate[selected_option]=E')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end

    if params[:bueno]
      url = URI.parse('http://ec2-184-72-222-38.compute-1.amazonaws.com/create?rate[device_id]='+@device+'&rate[in_date]=02/10/2012%2011:19:20&rate[selected_option]=B')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end
    if params[:regular]
      url = URI.parse('http://ec2-184-72-222-38.compute-1.amazonaws.com/create?rate[device_id]='+@device+'&rate[in_date]=02/10/2012%2011:19:20&rate[selected_option]=R')
      result = Net::HTTP.get(url)
      redirect_to contact2_path
    end
    if params[:malo]
      url = URI.parse('http://ec2-184-72-222-38.compute-1.amazonaws.com/create?rate[device_id]='+@device+'&rate[in_date]=02/10/2012%2011:19:20&rate[selected_option]=M')
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
