class Project < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :stages, dependent: :destroy
  accepts_nested_attributes_for :stages, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
end
