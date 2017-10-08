class SessionsController < ApplicationController
  def new
    if session[:user_id]!=nil
      user = User.find(session[:user_id])
      redirect_to user
    end
  end
  def create
    user = User.find_by(userid: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

      session[:user_id] = user.id
      redirect_to user

    else
      session.delete(:user_id)
      user = nil
      flash.now[:danger] = "Wrong ID Or Password"
      render 'new'

      end
  end
  def destroy
    session.delete(:user_id)
    user = nil
    render 'new'
  end
end
