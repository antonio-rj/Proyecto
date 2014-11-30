class Office < ActiveRecord::Base
	has_many :users
	validates :office_number, presence: true,numericality: { only_integer: true }
	validates :department, presence: true

	def combined_office
		"#{self.department}: #{self.office_number}"
	end

end
