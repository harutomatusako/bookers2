class UsersController < ApplicationController
    def index
    @book=Book.new
    @user=current_user
    @users=User.all
    end
    
    def edit
   
    
        if User.find(params[:id]) == current_user
        @user = current_user
        else
            redirect_to user_path(current_user)
        end
    
    end    
    
    def show
   
    @user = User.find(params[:id])
    @book=Book.new
    @books=@user.books
   
    end 
    
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice: 'You have created book successfully.'
    else
    render :edit
    end
    end
    
    private  
    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
