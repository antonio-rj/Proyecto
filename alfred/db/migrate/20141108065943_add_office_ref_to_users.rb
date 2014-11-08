class AddOfficeRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :office, index: true
  end
end
