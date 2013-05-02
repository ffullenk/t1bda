class ChangeCarreras < ActiveRecord::Migration
  def up
  	change_column :carreras, :codigo, :integer
  	change_column :carreras, :perfilIngresoResultado, :integer
  	change_column :carreras, :condicionOperacion, :integer
  	change_column :carreras, :capacidadAutoregulacion, :integer
  	change_column :carreras, :cantidadAniosAcreditada, :integer
  end

  def down
  end
end
