class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params["/login"][:name])
    user = user.try(:authenticate, params["/login"][:password])
    if user 
      session[:user_id] = user.id
      @user = user
      redirect_to root_path
    else
      redirect_to login_path
    end

    # return redirect_to(controller: 'sessions', action: 'new') unless user
    # session[:user_id] = user.id
    # @user = user
    # redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user
    redirect_to root_path
  end

end