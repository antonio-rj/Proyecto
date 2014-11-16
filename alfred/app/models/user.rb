class User < ActiveRecord::Base
	has_one :office
	validates :id_number, uniqueness: true
	def name
		"#{self.first_name.titleize} #{self.last_name.titleize}"
	end


end
