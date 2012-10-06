class AddIndexTiUsersEmail < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_index :usuarios, :email, unique: true
    #usuarios es la tabla de la DB
    #esto es para que cuando las personas crean un email, no se genera un usuario
    #con el mail duplicado

  end
end
