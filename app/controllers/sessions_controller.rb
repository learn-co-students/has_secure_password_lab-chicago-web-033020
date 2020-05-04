class SessionsController < ApplicationController
  def new
  end
  
  def create
    p "*******************"
    p params
    @user = User.find_by(name: params[:user][:name])
    if !@user
      redirect_to 'new'
    else
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to homepage_path(@user)
    end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
    end 
  end
end