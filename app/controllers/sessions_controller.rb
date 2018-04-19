class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_omniauth(auth)

    if @user.valid?
      session[:user_id] = @user.id
    else
      render 'welcome/home'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
