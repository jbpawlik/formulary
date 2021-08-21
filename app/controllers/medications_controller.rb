class MedicationsController < ApplicationController
  
  # def create
  # # @medication = Medication.last
  # # @user = User.create(params[:user])
  # # @medication.prescriptions.create(:medication_id => @medication.id)
  #   @medication = Medication.create!(medication_params)
  #   @medication.prescriptions.create(params[:prescription])
  # end
  # @user = User.create!(user_params)
  # @user.prescriptions.build(user_id: @user.id)

  # GET /medications
  def index
    @medications = Medication.all
    render json: @medications
  end

  # GET /medications/1
  def show
    @medication = Medication.find(params[:id])
    @users = User.where(MedicationUsers.user_id == params[:id])
    response = { :medication => @medication, :users => @users }
    render json: response
  end

  # POST /medications
  def create
    load_current_user!
    @medication = Medication.create!(medication_params)
    @medication_users = MedicationUsers.create!(user_id: @current_user.id, medication_id: @medication.id)
    render json: @medication
  end

  #GET /medications/random
  def random_search
    @medication = Medication.rand(50)
    render json: @medication
  end


  # PATCH/PUT /medications/1
  def update
    if @medication.update(medication_params)
      render json: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medications/1
  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    render json: Medication.all
  end

  private
  def medication_params
    params.require(:medication).permit(:name, :tier)
  end
end