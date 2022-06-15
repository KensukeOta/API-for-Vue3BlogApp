class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      payload = user
    else
      payload = { message: 'メールアドレスまたはパスワードが正しくありません。' }
    end
    render json: payload
  end

  def logout
    session.delete(:user_id);
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
