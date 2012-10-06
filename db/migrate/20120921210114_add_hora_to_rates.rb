class AddHoraToRates < ActiveRecord::Migration
  def change
    add_column :rates, :hora, :string
  end
end
