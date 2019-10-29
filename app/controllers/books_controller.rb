class BooksController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def new
	end

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
		@users = User.all
	end
	def about
	end
	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end
	def top
	end
	def create
		@user = current_user
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice]="You have created book successfully"
		  redirect_to book_path(@book.id)
		else
			@books = Book.all
			flash[:notice] = "error"
		  render action: :index
		end

	end
	def update
	@book = Book.find(params[:id])
	if @book.update(book_params)
		flash[:notice]="You have updated book successfully"
		redirect_to book_path
	else
		flash[:notice]="error"
		render action: :edit
	end
	end

	def edit
		@book = Book.find(params[:id])
		if current_user =! @book.user
		 	redirect_to books_path(current_user)
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

	def correct_user
		@book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless current_user == @user
  end
end


