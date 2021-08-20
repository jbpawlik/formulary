class Medication < ApplicationController
  
  def create
  @medication = Medication.last
  @user = User.create(params[:user])
  @medication.prescriptions.create(params[:medication_id => @medication.id])
  end

  # GET /users
  def index
    @medications = Medication.all
    render json: @medication
  end

  # GET /users/1
  def show
    @medication = Medication.find(params[:id])
    render json: @medication
  end

  # POST /users
  def create
    @medication = Medication.new(medication_params)
  end

  # PATCH/PUT /users/1
  def update
    if @medication.update(medication_params)
      render json: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @medication.destroy
  end
  private

  def medication_params
    params.require(:medication, :name, :tier)
  end
end