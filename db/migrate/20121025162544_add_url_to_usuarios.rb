class AddUrlToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :url, :string
  end
end
