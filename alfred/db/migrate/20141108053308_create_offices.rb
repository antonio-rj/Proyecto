class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.integer :office_number
      t.string :department

      t.timestamps
    end
  end
end
