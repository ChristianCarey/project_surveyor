class RangeSelection < ApplicationRecord
  belongs_to :question
  has_many   :answers, class_name: 'NumericAnswer', foreign_key: 'selection_id'
end
