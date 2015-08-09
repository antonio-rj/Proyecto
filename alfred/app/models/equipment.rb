class Equipment < ActiveRecord::Base
	validates :code_name, presence: true, length: { is: 10 }
	validates :device_name, presence: true
end
