class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']

    if is_mobile?
      redirect_to "/info?token=#{auth.credentials.token}&secret=#{auth.credentials.secret}&provider=#{auth.provider}&uid=#{auth.uid}"
    else
      if user_signed_in?
        user = current_user.update_account(auth)
      else
        user = User.find_or_create(auth)
      end

      user.save
      
      cookies[:current_user_id] = user.id

      redirect_to root_path
    end
  end

  def info
    render text: ""
  end

  def failure
    render text: "Error al iniciar sesión"
  end
end