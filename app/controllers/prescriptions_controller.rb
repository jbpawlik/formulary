class PrescriptionsController < ApplicationController
  
  def create
    @user = current_user
    @medication = Medication.last
    @prescriptions = PrescriptionsController.create!(user_id: @user.id, medication_id: @medication.id)
    render json: @prescriptions
  end

  def show
    @user = current_user
    @prescriptions = PrescriptionsController.find(@user.id)
    render json: @prescriptions
  end

  def update
    @user = current_user
    @prescriptions = PrescriptionsController.find(@user.id)
    if @prescriptions.update(@prescriptions_params)
      render json: @prescriptions
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @prescriptions.destroy
  end

  private
  def @prescriptions_params 
    params.require(:@prescriptions).permit(user_ids: [], medication_ids: [])
  end
end