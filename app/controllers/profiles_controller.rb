class ProfilesController < ApplicationController
  
  before_action :authenticate_user


  def show
    @profile = Profile.find_by(id: params[:id], user_id: current_user.id)
    render :show
  end 

  def new
    @profile = Profile.new
    render :new
  end

  def create
    @profile = Profile.create(
      profile_picture: params[:profile][:profile_picture],
      bio: params[:profile][:bio],
      user_id: current_user.id,
    )
    @profile.save
    redirect_to "/profile"
  end

  def edit
    @profile = Profile.find_by(id: params[:id], user_id: current_user.id)
    render :edit
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    @profile.profile_picture = params[:profile][:profile_picture]
    @profile.bio = params[:profile][:bio]
    @profile.save
    redirect_to "/profile"
  end


end
