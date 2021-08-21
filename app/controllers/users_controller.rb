class UsersController < ApplicationController
  before_action :authenticate_request!, except: [:welcome, :new, :create, :login] # Exclude this route from authentication

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

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  # debugger
  def create
    @user = User.create(user_params)
    # @user.save
    # @medication_user = MedicationUsers.create!(user_id: @user.id )
    # @user = User.new(user_params)
    # @user.save
    # @prescription = Prescription.create!(user_id: @user.id)
    # @medication = Medication.create(params[:medication])
    # @user.prescriptions.create(user_id: @user.id, )
    # @user.save

    if @user.save && @user.authenticate(user_params[:password])
      
      auth_token = JsonWebToken.encode(user_id: @user.id)
      flash[:alert] = "Your account has been created. Please save your auth token in a secure place."
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
      flash[:alert] = "Unable to process your request. Please try again."
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: User.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
