class ProfilesController < ApplicationController

  def show
    @profile = Profile.find_by(:user_id params[:user_id])
    render :show
  end 


end
