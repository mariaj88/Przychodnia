class Irena < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
end
