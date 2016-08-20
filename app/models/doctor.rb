class Doctor < ActiveRecord::Base
    has_many :irenas
    has_many :patients, through: :irenas
end
