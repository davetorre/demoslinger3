class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :destroy]
  before_action :admin, only: [:index, :destroy]
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit()
    end
  
    def signed_in_user
      redirect_to root_path unless signed_in?
    end
    
    def admin
      
    end
end
