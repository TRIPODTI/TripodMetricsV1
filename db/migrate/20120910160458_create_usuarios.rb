class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.datetime :fecha_registro
      t.datetime :fecha_ingreso
      t.string :empresa

      t.timestamps
    end
  end
end
