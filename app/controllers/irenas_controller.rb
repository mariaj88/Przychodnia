class IrenasController < ApplicationController
    before_action :set_doctor, only: [:show, :new, :patients]
    
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
        redirect_to patients_irenas_path doctor_id: params[:doctor_id]
        end 
    end

def show
   
end

def new
    @patients = Patient.where("name like ?", "%#{params[:q]}%").where(
                "pesel like?", "%#{params[:p]}%")
end 

def patients

end

def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
end

end
