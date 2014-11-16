class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'logged/home/index'
    else
      render 'home/index'
    end
  end
end
