class FriendController < ApplicationController
    before_action :authenticate_user!
  def create
      @friend = Friend.new(
          from_id: current_user.id,
          to_id: params[:to_id]
          )
      @friend.save
      redirect_to("/friends/index")
  end
    
  def destroy
      @friend = Friend.find_by(
          from_id: current_user.id,
          to_id: params[:to_id]
          )
      @friend.destroy
      redirect_to("/friends/index")
  end
  
  def index
    @friends = Friend.where(from_id:current_user.id).all
    @user = User.new
    end
  
  def post_index
    @friends = Friend.where(from_id:current_user.id).all
    @post = Post.new
  end
    
end
