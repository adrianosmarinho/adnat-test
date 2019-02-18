class Organisation < ApplicationRecord
    has_many :users

    #there must be a name and an hourly rate
    validates :name, presence: true
    validates :hourly_rate, presence: true
end
