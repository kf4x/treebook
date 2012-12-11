module ApplicationHelper

	#this returns the CSS class name for noitice bar
	def flash_type_hlpr (type)
		case type
		when :alert
			"alert-error"	#class="alert alert-error"
		when :notice
			"alert-success"	#class="alert alert-success"
		else
			""
		end
	end
end
