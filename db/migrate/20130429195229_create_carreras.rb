class CreateCarreras < ActiveRecord::Migration
  def change
    create_table :carreras do |t|
      t.string :nombre
      t.string :codigo
      t.string :perfilIngresoResultado
      t.string :condicionOperacion
      t.string :capacidadAutoregulacion
      t.integer :cantidadAniosAcreditada
      t.references :sede

      t.timestamps
    end
    add_index :carreras, :sede_id
  end
end
