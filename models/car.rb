class Car <  ActiveRecord::Base
    validates :make, presence: true
    validates :model, presence: true
    validates :fuel_type, presence: true
    validates :gearbox, presence: true
    validates :year, presence: true
end