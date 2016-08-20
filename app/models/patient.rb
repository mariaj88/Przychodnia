class Patient < ActiveRecord::Base
    has_many :irenas
    has_many :doctors, through: :irenas
end
