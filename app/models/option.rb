class Option < ApplicationRecord
  belongs_to :multiple_choice_selection
  has_many   :answers, class_name: 'MultipleChoiceAnswer'
end
