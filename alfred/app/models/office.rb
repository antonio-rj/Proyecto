class Office < ActiveRecord::Base
	has_many :users

	def combined_office
		"#{self.department}: #{self.office_number}"
	end

end
