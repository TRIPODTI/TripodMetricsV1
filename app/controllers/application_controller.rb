class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include LoginsHelper#para gestionar sesion de usuario y el logout
  include RatesHelper
end

