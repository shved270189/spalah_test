class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :set_session_user_id

  private

  def set_session_user_id
    # binding.pry
    # session['count'] ||= 0
    # session['count'] += 1

    # binding.pry
    # cookies[:some_cookie] = 'hello'
    if (cookies.signed[:email].blank? && cookies.signed[:password].blank?) || session['user_id'].present?
      return
    end
    user = User.find_by(email: cookies.signed[:email])
    # binding.pry
    if user.try(:password) == cookies.signed[:password]
      session['user_id'] = user.id
    end
  end

  def current_user
    @user ||= User.find_by(id: session['user_id'])
  end

  def authenticate!
    render(file: 'public/401.html', status: :unauthorized) if current_user.blank?
  end

  def authenticate_owner!
    render(file: 'public/401.html', status: :unauthorized) unless current_user.admin?
  end
end
