class MultipleChoiceAnswer < ApplicationRecord
  belongs_to :response
  belongs_to :option
  belongs_to :selection, class_name: 'MultipleChoiceSelection'

  def value
    option.value
  end
end
