module FriendshipsHelper
  def friendship_status(user,friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user,friend)
    if user == friend
      return ''
    else
    return "#{friend.full_name} is not your friend yet" if friendship.nil?
    end
    case friendship.status
      when 'requested'
        "#{friend.full_name} would like to be your friend."
      when 'pending'
        "#{friend.full_name} has sent you a friend request"
      when 'accepted'
        "Friends with #{friend.full_name} since #{time_ago_in_words(friendship.created_at)} ago"
      else
        "#{friend.full_name} is not your friend yet"
    end
  end
  def sent_status(user,friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user,friend)
    return "#{friend.full_name} is not your friend yet" if friendship.nil?
    case friendship.status
      when 'requested'
        "#{friend.full_name} would like to be your friend."
      when 'pending'
        " You have sent #{friend.full_name} a friend request"
      when 'accepted'
        "Friends with #{friend.full_name} since #{time_ago_in_words(friendship.accepted_at)} ago"

    end
  end
end
