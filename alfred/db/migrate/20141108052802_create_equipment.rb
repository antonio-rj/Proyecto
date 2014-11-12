class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :device_name
      t.integer :code_name
      t.boolean :available

      t.timestamps
    end
  end
end
