class UsersController < ApplicationController
  before_action :authenticate_request!, except: [:welcome, :new, :create, :login]
  before_action :set_user, only: [:show, :update, :destroy]

  def login
    user = User.find_by(email: user_params[:email].to_s.downcase)
    if user&.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @medications = Medication.all.values.to_a
    @prescriptions = Prescription.find(@user.id)
    new_array = @medications.select {|user_id| @prescriptions.user_id  != @user.id }
    response = { :user => @user['email'], :name => new_array.select {|element| element.values == 0 }, :tier => rand(1..4) }
    render json: response
  end

  def create
    @user = User.create(user_params)
    if @user.save && @user.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode(user_id: @user.id)
      flash[:alert] = "Your account has been created. Your authorization token is #{auth_token}.  Please save your auth token in a secure place."
      # render json: { auth_token: auth_token }, status: :ok
      # token_response = ["#{auth_token}", status: :ok]
      redirect_to '/'
    else
      # render json: @user.errors, status: :unprocessable_entity
      token_error_response = { json: @user.errors, status: :unprocessable_entity }
      flash[:alert] = "Unable to process your request.#{token_error_response} Please try again."
      redirect_to '/'

    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: User.all
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
