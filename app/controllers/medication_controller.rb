class Medication < ApplicationController
  
  def create
  @med = Medication.new(params[:Medication])
  @med.prescriptions.create(params[:prescription])
  end
end