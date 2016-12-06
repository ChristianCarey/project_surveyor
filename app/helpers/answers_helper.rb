module AnswersHelper
  def answer_form_for(question)
    if question.selection_class == MultipleChoiceSelection
      return 'answers/multiple_choice_form'
    elsif question.selection_class == RangeSelection
      return 'answers/range_form'
    end        
  end
end