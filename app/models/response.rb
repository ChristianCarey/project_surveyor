class Response < ApplicationRecord
  belongs_to :survey
  has_many   :numeric_answers,         dependent: :destroy
  has_many   :multiple_choice_answers, dependent: :destroy
  accepts_nested_attributes_for :numeric_answers
  accepts_nested_attributes_for :multiple_choice_answers

  def answers
    numeric_answers + multiple_choice_answers
  end

  def build_answer(question)
    if question.selection_class == MultipleChoiceSelection
      collection = multiple_choice_answers
    elsif question.selection_class == RangeSelection
      collection = numeric_answers
    end
    collection.build
  end
end
