class Location < ApplicationRecord
    has_and_belongs_to_many :customers
    has_many :cloths
end
