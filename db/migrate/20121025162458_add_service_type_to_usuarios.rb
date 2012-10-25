class AddServiceTypeToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :service_type, :string
  end
end
