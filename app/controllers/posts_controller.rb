class PostsController < ApplicationController
  
  before_action :authenticate_user

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      profile_id: current_user.profiles[0].id,
      post_image: params[:post][:post_image],
      caption: params[:post][:caption],
    )
    @post.save!
    redirect_to "/profiles" 
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to "/profiles"
  end

end
