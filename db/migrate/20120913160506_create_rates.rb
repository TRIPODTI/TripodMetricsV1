class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :device_id
      t.datetime :in_date
      t.string :selected_option

      t.timestamps
    end

    #esto hace que se haga una búsqueda de las dos llaves en simultanea
  end
end
