class AddAnoToRates < ActiveRecord::Migration
  def change
    add_column :rates, :ano, :string
  end
end
