class ProfilesController < ApplicationController

  def show
    @profile = Profile.find_by(user_id: params[:user_id])
    render :show
  end 

  def edit
    @profile = Profile.find_by(id: params[:id])
    render :edit
  end

  def update
    profile = Profile.find_by(id: params[:id])
    profile.profile_picture = params[:profile][:profile_picture]
    profile.bio = params[:profile][:bio]
    profile.save
    redirect_to "/profile"
  end


end
