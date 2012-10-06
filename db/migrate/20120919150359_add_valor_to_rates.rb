class AddValorToRates < ActiveRecord::Migration
  def change
    add_column :rates, :valor, :Integer, default: 0
  end
end
