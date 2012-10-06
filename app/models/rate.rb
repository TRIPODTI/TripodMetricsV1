class Rate < ActiveRecord::Base

  attr_accessible :id, :device_id, :in_date, :selected_option, :valor, :mes, :ano, :dia, :hora, :mesint
  validates :device_id, presence:true


  belongs_to :dispositivo
  belongs_to :usuario,    :foreign_key => "device_id"

  #rate.dispositivo - entrega el objeto Usuario asociado a ese rate
  #dispositivo.rates - entrega un array de todos los rates de ese dispositivo
  #dispositivo.rates.create(arg) crea un rate con el respectivo device_id=dispositivo.id
  #dispositivo.rates.create!(arg) crea un rate exception failure
  #dispositivo.rates.build(arg) retorna un nuevo objeto rates (device_id=dispositivo.id)


 end
