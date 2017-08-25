class SessionsController < ApplicationController
  def new
  end

  def create
    @user = find_by_credentials(user_params(:user_name), user_params(:password))
    if @user.nil?
      flash.now[:errors] = ["Invalid token"]
    else
      login!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end
end
