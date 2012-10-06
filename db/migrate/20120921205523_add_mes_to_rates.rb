class AddMesToRates < ActiveRecord::Migration
  def change
    add_column :rates, :mes, :string
  end

end
