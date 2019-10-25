class Company < ApplicationRecord
  validates :name, :city, presence: true
end
