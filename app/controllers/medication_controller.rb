class Medication < ApplicationController
  
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
    render json: @medications.order
  end

  # GET /medications/1
  def show
    @medication = Medication.find(params[:id])
    render json: @medication
  end

  # POST /medications
  def create
    @user = current_user
    @medication = Medication.create!(medication_params)
    @medication_users = MedicationUsers.create!(user_id: @user.id, medication_id: @medication.id)
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
    @medication.destroy
  end

  private
  def medication_params
    params.require(:medication, :name, :tier)
  end
end