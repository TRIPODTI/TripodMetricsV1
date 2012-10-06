class AddDiaToRates < ActiveRecord::Migration
  def change
    add_column :rates, :dia, :string
  end
end
