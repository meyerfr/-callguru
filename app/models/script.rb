class Script < ApplicationRecord
  belongs_to :section, optional: true
end
