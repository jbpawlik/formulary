class Prescription < ApplicationController
  
  def create
  @script = Prescription.new(params[:Prescription])
  @script.users.create(params[:user])
  end
end