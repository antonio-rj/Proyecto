class AddUserAndEquipmentRefsToControl < ActiveRecord::Migration
  def change
    add_reference :controls, :equipment, index: true
    add_reference :controls, :user, index: true
  end
end
