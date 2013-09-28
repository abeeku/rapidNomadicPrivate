module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.full_name, class: "gravatar")
  end
	def thumb(user, width = 80,  height = 80)
	image_tag(user.avatar_url(:thumb), :width => width, :height => height)
	end	
end
