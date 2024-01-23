class AdminController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to admin_index_path
    else
      flash[:alert] = "User not created"
      @users = User.all
      render :index
      # redirect_to admin_index_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to admin_index_path
    else
      flash[:alert] = "User not updated"
      redirect_to admin_index_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted successfully"
      redirect_to admin_index_path
    else
      flash[:alert] = "User not deleted"
      redirect_to admin_index_path
    end
  end
  
  private

  def authorize_admin!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation , :role) 
  end

  def set_user
    @user = User.find(params[:id])
  end
end
