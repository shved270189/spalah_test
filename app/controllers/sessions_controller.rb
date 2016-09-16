class SessionsController < ApplicationController
  before_action :set_user


  def create
    @user.update(picture: auth_hash['info']['image'],
                 name: auth_hash['info']['name'],
                 email: auth_hash['info']['email'])
    session['user_id'] = @user.id
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_or_initialize_by(provider: auth_hash['provider'], provider_id: auth_hash['uid'])
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
