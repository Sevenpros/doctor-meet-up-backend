class DoctorsController < ApplicationController
  # before_action :set_doctor, only: %i[show update destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all

    render json: @doctors
  end

  # GET /doctors/1
  def show

    @doctor = Doctor.find(params[:id])
    render json: @doctor
  rescue ActiveRecord::RecordNotFound
    raise JsonapiErrorsHandler::Errors::NotFound
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end


  # DELETE /doctors/1
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: {message: "doctor deleted"}
  rescue ActiveRecord::RecordNotFound
    raise JsonapiErrorsHandler::Errors::NotFound
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialization, :phone, :email, :city, :bio, :photo)
  end
end
