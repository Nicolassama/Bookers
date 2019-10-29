class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def new
	end

	def index
		@books = Book.all
		@user = current_user
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@thebook = @user.books.all
	end

	def edit
		@user = User.find(params[:id])
		if current_user =! @user
		 	redirect_to user_path(current_user)
		end
	end

	def update
		@user = current_user
		if @user.update(user_params)
			flash[:notice]="You have updated user successfully."
			redirect_to current_user
		else
			flash[:notice] = "error"
			render action: :edit
		end
	end

	def create

	end

	private
	def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
    	def book_params
      params.require(:book).permit(:title, :body)
    end
    def correct_user
    	@user = User.find(params[:id])
    	redirect_to user_path(current_user) unless current_user == @user
    end

end
