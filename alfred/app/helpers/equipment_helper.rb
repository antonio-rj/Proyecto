module EquipmentHelper
	def equip_status(status)
		if status 
			content_tag(:i, "", :class =>  "glyphicon glyphicon-check green")
		else
			content_tag(:i, "", :class => "glyphicon glyphicon-share red")	
		end
	end
end
