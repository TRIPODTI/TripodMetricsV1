class AddCounterToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :counter, :integer
  end
end
