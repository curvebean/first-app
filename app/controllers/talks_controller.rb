class TalksController < ApplicationController
  before_action :authenticate_user!
  def index
    @friends = Friend.where(from_id:current_user.id).all
    
    @talks = Talk.where(send_user_id: current_user.id).or(Talk.where(sended_user_id: current_user.id)).order(created_at: :desc)
  end
  def show
    @talks = 
    Talk.where(send_user_id: current_user.id,sended_user_id: params[:id]).or(Talk.where(send_user_id: params[:id],sended_user_id:current_user.id)).order(created_at: :asc)
  end
  
  def create
    @talk_last = Talk.last
    @talk = Talk.new(
      send_user_id: @current_user.id,
      sended_user_id: params[:id],
      content: params[:content] 
      )
    if params[:image]
      @talk.image_name = "#{@talk_last.id + 1}.jpg"
      image = params[:image]
      File.binwrite("public/talk_images/#{@talk.image_name}",
      image.read)
    end
    
    if @talk.save
      redirect_to("/talks/#{params[:id]}/show")
    else
      render("talks/#{params[:id]}/show")
    end
  end
end
