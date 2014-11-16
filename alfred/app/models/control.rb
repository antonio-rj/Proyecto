class Control < ActiveRecord::Base
	has_many :users
	has_many :equipments
	validates :user_id, presence: true
	validates :equipment_id, presence: true

end
