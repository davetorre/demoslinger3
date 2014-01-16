class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :destroy]
  before_action :admin, only: [:index, :destroy]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def index
   @users = User.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit()
    end
    
    def admin
      redirect_to(root_url) unless current_user.admin?
    end
end
