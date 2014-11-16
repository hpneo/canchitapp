class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_tmdb_configuration

  def user_signed_in?
    cookies[:current_user_id].present?
  end

  def current_user
    User.where(id: cookies[:current_user_id]).first if user_signed_in?
  end

  def is_mobile?
    browser = Browser.new(ua: request.user_agent)

    browser.mobile? || browser.tablet?
  end

  def get_tmdb_configuration
    if @tmdb_configuration.nil?
      configuration = Tmdb::Configuration.new
      
      @tmdb_configuration = {
        base_url: configuration.base_url,
        secure_base_url: configuration.secure_base_url,
        poster_sizes: configuration.poster_sizes,
        backdrop_sizes: configuration.backdrop_sizes,
        profile_sizes: configuration.profile_sizes,
        logo_sizes: configuration.logo_sizes
      }
    end

    @tmdb_configuration
  end
  
  helper_method :user_signed_in?
  helper_method :current_user
  helper_method :is_mobile?
end
