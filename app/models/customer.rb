class Customer < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :locations
    has_many :cloths, through: :locations

    validates :f_name, presence: true
    validates :l_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :category, presence: true
    validates :password_digest, presence: true
end
