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

ActiveRecord::Schema.define(:version => 20130429195252) do

  create_table "carreras", :force => true do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.string   "perfilIngresoResultado"
    t.string   "condicionOperacion"
    t.string   "capacidadAutoregulacion"
    t.integer  "cantidadAniosAcreditada"
    t.integer  "sede_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "carreras", ["sede_id"], :name => "index_carreras_on_sede_id"

  create_table "sedes", :force => true do |t|
    t.string   "nombre"
    t.string   "ciudad"
    t.integer  "universidad_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "sedes", ["universidad_id"], :name => "index_sedes_on_universidad_id"

  create_table "universidads", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
