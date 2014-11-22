module UsersHelper
	def office_is_present?(office_id)			
		if office_id
			office = Office.find office_id
			"#{office.office_number} #{office.department}"
		else
			"N/A"
		end		
	end

end
