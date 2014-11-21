class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'logged/home/index'
    else
      render 'home/index'
    end
  end

  def map
    @latitude = params[:latitude].present? ? params[:latitude] : -12.103951800
    @longitude = params[:longitude].present? ? params[:longitude] : -76.963278100 
    render 'home/map', layout: 'map'
  end
end
