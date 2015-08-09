class Control < ActiveRecord::Base
	has_many :users
	has_many :equipments
	validates :user_id, presence: true
	validates :equipment_id, presence: true

	scope :borrowed, -> { where(returned_at: nil) }
	scope :returned, -> { where('returned_at IS NOT NULL') }

end
