class MultipleChoiceSelection < ApplicationRecord
  belongs_to :question
  has_many   :answers, class_name: 'MultipleChoiceAnswer', foreign_key: 'selection_id'
  has_many   :options, dependent: :destroy
  accepts_nested_attributes_for :options
end
