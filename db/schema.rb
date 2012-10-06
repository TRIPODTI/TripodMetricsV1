# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120924141035) do

  create_table "dispositivos", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "creado_por"
    t.boolean  "status"
    t.string   "device_id"
    t.integer  "sede_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dispositivos", ["sede_id"], :name => "index_dispositivos_on_sede_id"
  add_index "dispositivos", ["usuario_id"], :name => "index_dispositivos_on_usuario_id"

  create_table "rates", :force => true do |t|
    t.string   "device_id"
    t.datetime "in_date"
    t.string   "selected_option"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "valor",           :default => 0
    t.string   "mes"
    t.string   "ano"
    t.string   "dia"
    t.string   "hora"
    t.integer  "mesint"
  end

  add_index "rates", ["device_id"], :name => "index_rates_on_device_id"

  create_table "sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "fecha_registro"
    t.datetime "fecha_ingreso"
    t.string   "empresa"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["remember_token"], :name => "index_usuarios_on_remember_token"

end
