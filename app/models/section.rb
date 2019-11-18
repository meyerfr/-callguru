class Section < ApplicationRecord
  belongs_to :stage, optional: true
  has_many :scripts
  accepts_nested_attributes_for :scripts, allow_destroy: true, reject_if: proc { |att| att['text'].blank? }
end
