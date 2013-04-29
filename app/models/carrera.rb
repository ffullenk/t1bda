class Carrera < ActiveRecord::Base
  belongs_to :sede
  attr_accessible :cantidadAniosAcreditada, :capacidadAutoregulacion, :codigo, :condicionOperacion, :nombre, :perfilIngresoResultado, :sede_id
end
