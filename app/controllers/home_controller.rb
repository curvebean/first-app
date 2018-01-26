class HomeController < ApplicationController
  def home
    if user_signed_in?
      render :top
    end
  end
  def about
    render :layout => "about"
  end
end
