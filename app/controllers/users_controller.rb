class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    @user.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path(@book.id)
  end
  
  def index
  end

  def show
    @book = Book.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:title, :body)
  end
    
end