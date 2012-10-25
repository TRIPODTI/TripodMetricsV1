class Usuario < ActiveRecord::Base

  attr_accessible :updated_at,:email, :empresa, :fecha_ingreso, :fecha_registro, :name, :password, :password_confirmation, :counter, :service_type, :url
  has_secure_password
  has_many :dispositivos, dependent: :destroy   #esto elimina dispotivos al momento de eliminar
                                                #usuarios
  has_many :rates, :through => :dispositivos

  before_save { |usuario| usuario.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #EN RUBY MAYUSUCULA SOSTENIDA ES UAN KTE
  validates :name, presence: true, length: {maximum: 50}
  validates  :email, presence: true,
             format:{ with:VALID_EMAIL_REGEX },
             uniqueness:{ case_sensitive:false}
  validates :password, presence: true    #aquí pasó algo con el limite tamaño del password
  validates :password_confirmation, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64  #aqúi se crea el token que permite
      #crear una sesión segura y que permanece activa.
    end
end
