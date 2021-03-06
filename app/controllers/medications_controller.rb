class MedicationsController < ApplicationController
  before_action :authenticate_request! #, except: [:welcome, :new, :create, :login]
  def index
    @medications = Medication.all
    render json: @medications
  end

  def show
    @medication = Medication.find(params[:id])
    @prescriptions = Prescription.find(@medication.id)
    prescribed = @prescriptions.user_id
    @users = User.where(id: prescribed)
    response = { :medication => @medication, :users => @users }
    render json: response
  end

  def create
    load_current_user!
    @medication = Medication.create!(medication_params)
    @prescriptions = Prescriptions.create!(user_id: @current_user.id, medication_id: @medication.id)
    render json: @medication
  end

  def random_search
    @medication = Medication.all.shuffle.first
    response = @medication
    random_num = Random.rand(1..25)
    render json: response['name']
  end

  def update
    if @medication.update(medication_params)
      render json: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

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