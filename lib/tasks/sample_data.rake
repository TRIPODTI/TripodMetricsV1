namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'db_populate'
    admin = Usuario.create(name: "Admin",
                           email: "admin@tripod.net.co",
                            password: "tripodadmin",
                            password_confirmation: "tripodadmin")
    admin.toggle!(:admin)
    #ejecutar reset de la db
    #ejecutar rake db:populate



    end
end