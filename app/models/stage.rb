class Stage < ApplicationRecord
  belongs_to :project, optional: true
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }

  def next
    project.stages.where("id > ?", id).first
  end

  def prev
    project.stages.where("id < ?", id).last
  end
end
