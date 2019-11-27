class Company < ApplicationRecord
  validates :email, presence: true
end
