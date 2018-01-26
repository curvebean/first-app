class UsersController < ApplicationController
  before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
  
  def index
    @users = User.where.not(id: @current_user.id)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
end
