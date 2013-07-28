module ApplicationHelper
  def profile_for(user)
    profile_url(:username => user.username)
  end
  def friends_for(user)
    show_friends_url(:username => user.username)
  end

  def photos_for(user)
    user_photos_url(:username => user.username)
  end
  def info_for(user)
    user_info_url(:username => user.username)
  end
end
