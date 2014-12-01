class ChangeDataTypeForCodeName < ActiveRecord::Migration
  def up
  	change_table :equipment do |t|
  		t.change :code_name, :string
  	end
  end

  def down
  	change_table :equipment do |t|
  		t.change :code_name, :integer
  	end
  end
end
