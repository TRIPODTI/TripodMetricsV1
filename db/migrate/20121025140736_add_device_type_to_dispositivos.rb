class AddDeviceTypeToDispositivos < ActiveRecord::Migration
  def change
    add_column :dispositivos, :device_type, :string
  end
end
