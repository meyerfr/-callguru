class Team < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  has_many :calls
end
