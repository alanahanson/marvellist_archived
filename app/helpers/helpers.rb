helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def check_for_current_user
    if current_user
      pass
    else
      halt(404, erb(:'404'))
    end
  end

  def authorize_user(user_id)
    if current_user.id == user_id.to_i
      pass
    else
      halt(404, erb(:'404'))
    end
  end


end


