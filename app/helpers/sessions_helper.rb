module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    user.create_remember_token
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user
    if(token = cookies[:remember_token])
      @current_user ||= User.find_by(remember_digest: User.digest(token))
    else
      nil
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def log_out
    @current_user.forget
    @current_user = nil
    cookies.delete(:remember_token)
  end

end
