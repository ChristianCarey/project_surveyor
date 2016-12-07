module AnswersHelper
  def answer_form_for(question)
    if question.selection_class == MultipleChoiceSelection
      'answers/multiple_choice_form'
    elsif question.selection_class == RangeSelection
      'answers/range_form'
    end        
  end

  def answer_partial(answer)
    if answer.is_a? MultipleChoiceAnswer
      'answers/multiple_choice_answer'
    elsif answer.is_a? NumericAnswer
      'answers/numeric_answer'
    end 
  end
end