class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth'].credentials

    redirect_to "/info?token=#{auth.token}&secret=#{auth.secret}"
  end

  def info
    render status: 200
  end

  def failure
  end
end
