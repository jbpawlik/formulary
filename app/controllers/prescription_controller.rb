class Prescription < ApplicationController
  
  def create
    @medication = Medication.find(params[:id])
    @user = User.find(params[:id])
    @prescription = Prescription.new(params[:prescription_params])
    @prescription.save
  end

  def edit
    @user = current_user
  end

  def show
    @prescription = Prescription.find(params[:id])
    render json: @prescription
  end

  def update
    @user = current_user
    if @user.update(prescription_params)
      render json: @prescription
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def prescription_params 
    params.require(:prescription, user_ids: [], medication_ids: [])
  end
end