class QuestionsController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(question_params)
    if @survey.save
      redirect_to selection_path(@question)
    else
      flash[:danger] = "Try again please."
      render :new
    end
  end

  private

  def selection_path(question)
    if question.selection_class == MultipleChoiceSelection
      new_question_multiple_choice_selection_path(@question)
    elsif question.selection_class == RangeSelection
      new_question_range_selection_path(@question)
    end
  end
  
  def question_params
    params.require(:question).permit(:prompt, :required, :selection_type_id, :survey_id)
  end
end
