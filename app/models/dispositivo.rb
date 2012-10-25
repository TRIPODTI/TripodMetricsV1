class Dispositivo < ActiveRecord::Base
  attr_accessible :creado_por, :device_id, :sede_id, :status, :usuario_id, :device_type
  #quitamos usuario id de los atributos accesibles para evitar edición
  belongs_to :usuario     #así creo la asociación entre tablas
                          #quiere decir que micropost tiene un usuario asociado
                          #has many es que un usuario tiene mucho devices

  has_many :rates

  #validates :device_id, presence: true, length: { maximum: 6 }

  default_scope order: 'dispositivos.created_at DESC' #esto es SQL por orden descendiente

end
