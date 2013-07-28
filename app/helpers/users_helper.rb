module UsersHelper
	def thumb(user, width = 80,  height = 80)
	image_tag(user.profile(:thumb), :width => width, :height => height)
	end	
end
