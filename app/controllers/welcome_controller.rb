class WelcomeController < ApplicationController

  def welcome
    render :welcome
  end

  def create
    @user = User.new(user_params)
  
    if @user.save && @user.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode(user_id: @user.id)
      flash[:notice] = "Your account has been created. Please save your auth token in a secure place."
      render json: { auth_token: auth_token }, status: :ok
    else
      flash[:alert] = "Unable to process your request. Please try again."
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
