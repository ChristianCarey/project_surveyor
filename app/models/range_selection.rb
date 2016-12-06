class RangeSelection < ApplicationRecord
  belongs_to :question
  has_many   :answers, as: :selection
end
