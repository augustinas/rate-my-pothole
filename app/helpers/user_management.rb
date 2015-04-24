module UserManagement

  def current_user
    User.first(id: session[:user_id])
  end

  def new_user(params)
    User.new(username: params[:username],
             email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
  end
end
