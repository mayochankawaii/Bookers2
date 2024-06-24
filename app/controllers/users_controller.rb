class UsersController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    @user.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path(@book.id)
  end
  
  def index
    @Book = Book.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
    
end