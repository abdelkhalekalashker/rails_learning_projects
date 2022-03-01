class UsersController < ApplicationController

    
    def show
        render :show
    end 

    def index
        @users = User.all
        render :index
    end

    def create 
        @user = User.new(user_params)

        if @user.save
            login_user!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            
            render :new
        end
    end

    def new
        @user=User.new

        render :new
    end

    def destroy
        @user=User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:email, :password) 
    end
end
