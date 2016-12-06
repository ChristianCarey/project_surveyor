module AnswersHelper
  def answer_form_for(question)
    if question.selection_class == MultipleChoiceSelection
      return 'answers/multiple_choice_form'
    elsif question.selection_class == RangeSelection
      return 'answers/range_form'
    end        
  end

  def answer_partial(answer)
    if answer.is_a? MultipleChoiceAnswer
      return 'answers/multiple_choice_answer'
    elsif answer.is_a? NumericAnswer
      return 'answers/numeric_answer'
    end 
  end
end