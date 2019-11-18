class Project < ApplicationRecord
  belongs_to :user
  has_many :stages, dependent: :destroy
  accepts_nested_attributes_for :stages, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
end
