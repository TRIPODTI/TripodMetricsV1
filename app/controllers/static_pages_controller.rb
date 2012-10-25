class StaticPagesController < ApplicationController
  def home
    #este codigo se ejecuta cuando se invoca la página home o help o contacto
    $logo="Logo2.png"
  end

  def help
  end

  def contacto
    $logo="Logo2.png"
  end
end
