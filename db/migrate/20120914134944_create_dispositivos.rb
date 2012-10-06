class CreateDispositivos < ActiveRecord::Migration
  def change
    create_table :dispositivos do |t|
      t.integer :usuario_id
      t.string :creado_por
      t.boolean :status
      t.string :device_id
      t.integer :sede_id

      t.timestamps
    end
    add_index :dispositivos, :usuario_id
    add_index :dispositivos, :sede_id
    #si quiero que trabajen dos llaves juntas entonces
    #add_index :dispositivos, [:usuario_id , :created_at]
  end
end
