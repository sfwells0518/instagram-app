class SessionsController < ApplicationController
  def new
    render template: "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
  
      redirect_to "/profile"
    else
      render json: {message: "Incorrect email or password. Try again"}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
