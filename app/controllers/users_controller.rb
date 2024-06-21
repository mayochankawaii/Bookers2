class UsersController < ApplicationController
  has_one_attached :image
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to post_images_path
  end
  
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :image, :body)
  end
    
end