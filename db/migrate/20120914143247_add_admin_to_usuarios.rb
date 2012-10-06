class AddAdminToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :admin, :boolean, default: false #no todos los usuarios son admin

    #debo crear un usuario por default en task/sample_data.rake
  end
end
