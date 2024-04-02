class Cloth < ApplicationRecord
  belongs_to :location
  has_many :feedbacks, dependent: :destroy
end
