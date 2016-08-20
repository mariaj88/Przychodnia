class Patient < ActiveRecord::Base
    validates :pesel, presence: true
    validates :pesel, pesel: true
    
    has_many :irenas
    has_many :doctors, through: :irenas
end
