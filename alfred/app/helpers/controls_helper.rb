module ControlsHelper

	def formatted_date(time)
		time.to_formatted_s(:long_ordinal)
	end
end
