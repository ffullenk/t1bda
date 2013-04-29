class CreateSedes < ActiveRecord::Migration
  def change
    create_table :sedes do |t|
      t.string :nombre
      t.string :ciudad
      t.references :universidad

      t.timestamps
    end
    add_index :sedes, :universidad_id
  end
end
