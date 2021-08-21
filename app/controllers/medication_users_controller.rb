class MedicationUsers < ApplicationController
  
  def create
    @user = current_user
    @medication = Medication.last
    @medication_users = MedicationUsers.create!(user_id: @user.id, medication_id: @medication.id)
    render json: @medication_users
  end

  def show
    @user = current_user
    @medication_users = MedicationUsers.find(@user.id)
    render json: @medication_users
  end

  def update
    @user = current_user
    @medication_users = MedicationUsers.find(@user.id)
    if @medication_users.update(@medication_users_params)
      render json: @medication_users
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @medication_users.destroy
  end

  private
  def @medication_users_params 
    params.require(:@medication_users).permit(user_ids: [], medication_ids: [])
  end
end