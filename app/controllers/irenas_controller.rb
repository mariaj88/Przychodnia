class IrenasController < ApplicationController
    before_action :set_doctor, only: [:new, :patients]
    
    def check
        date_s = Date.today.to_s + " " + "#{8+params[:hour].to_i}:00:00"
        datetime = DateTime.parse(date_s)
        doctor = Doctor.find(params[:doctor_id])
        
        #irena = Irena.find_or_create_by(hour: datetime, doctor: doctor)
        irena = Irena.find_by(hour: datetime, doctor: doctor)
        
        if irena.present?
        redirect_to irena_path irena, doctor_id: params[:doctor_id]
        else
        #redirect_to new_irena_path doctor_id: params[:doctor_id] 
        redirect_to patients_irenas_path doctor_id: params[:doctor_id], date: datetime
        end 
    end

def show
    @irena = Irena.find(params[:id])
   
end

def new
    @patients = Patient.where("name like ?", "%#{params[:q]}%").where(
                "pesel like?", "%#{params[:p]}%")
end 

def patients

end

def create
    @irena = Irena.create(doctor: Doctor.find(params[:doctor_id]),
                      patient: Patient.find(params[:patient_id]),
                      hour: DateTime.parse(params[:date]))
    redirect_to @irena
end

private

def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
end

end
