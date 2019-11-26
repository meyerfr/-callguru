class Section < ApplicationRecord
  belongs_to :stage, optional: true
  has_many :scripts, dependent: :destroy
  accepts_nested_attributes_for :scripts, allow_destroy: true, reject_if: proc { |att| att['text'].blank? }

  def next
    stage.sections.where("id > ?", id).first
  end

  def prev
    stage.sections.where("id < ?", id).last
  end
end
