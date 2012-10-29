# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# yor.create(name: 'Emanuel', city: cities.first)
admin = Usuario.create(name: "Admin",
                       email: "admin@tripod.net.co",
                       password: "tripodadmin",
                       password_confirmation: "tripodadmin")
admin.toggle!(:admin)