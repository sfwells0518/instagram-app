class UsersController < ApplicationController
  def new
    @user = User.new
    render template: "users/new"
    # render json: {message: "testing new IG user action"}
  end

  def create
    @user = User.new(
      email: params[:user][:email],
      full_name: params[:user][:full_name],
      username: params[:user][:username],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/login"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
