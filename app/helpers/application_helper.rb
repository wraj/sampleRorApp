module ApplicationHelper
	def full_title(page_title = "")
		base_title = "Ruby On Rails Tutorial Sample App"
		if page_title.blank? || page_title.empty?
			base_title
		else
			page_title + " | " + base_title	
		end

	end
end
