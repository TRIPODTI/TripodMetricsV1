class AddMesintToRates < ActiveRecord::Migration
  def change
    add_column :rates, :mesint, :integer
  end
end
