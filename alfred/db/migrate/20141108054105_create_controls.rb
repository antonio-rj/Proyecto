class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.timestamp :returned_at

      t.timestamps
    end
  end
end
