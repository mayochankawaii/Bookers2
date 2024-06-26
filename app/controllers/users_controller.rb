class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @user = User.new(post_image_params)
    @user.user_id = current_user.id
    @user.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path(@book.id)

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have created user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end