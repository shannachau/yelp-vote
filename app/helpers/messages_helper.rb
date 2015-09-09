module MessagesHelper
  def username(entry)
    user = User.find(entry.user_id)
    return user.username
  end
end
