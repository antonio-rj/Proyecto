class User < ActiveRecord::Base
	has_one :office
	validates :id_number, uniqueness: true, length: { is: 9 },numericality: { only_integer: true }
	validates :first_name, presence: true
	validates :last_name, presence: true
	def name
		"#{self.first_name.titleize} #{self.last_name.titleize}"
	end

end
