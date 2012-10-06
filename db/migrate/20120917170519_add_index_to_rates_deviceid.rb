class AddIndexToRatesDeviceid < ActiveRecord::Migration
  def change
    add_index :rates, :device_id
  end
end
