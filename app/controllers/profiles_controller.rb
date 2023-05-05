class ProfilesController < ApplicationController
  
  before_action :authenticate_user

  skip_before_action :verify_authenticity_token, only: [:update]
  
  def profile_params
    params.require(:profile).permit(:profile_picture, :bio)
  end

  def show
    @profile = Profile.find_by(user_id: current_user.id)
    @posts = current_user.posts.order(created_at: :desc)
    @post = Post.new
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
    @profile.save!
    redirect_to "/profiles"
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
      @profile.save!
      redirect_to "/profiles"
    else
      render :edit
    end
  end

end
