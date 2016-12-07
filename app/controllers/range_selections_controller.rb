class RangeSelectionsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])    
    @selection = @question.build_selection(RangeSelection, 
                                           { question_id: @question.id})
  end

  def create
    @question = Question.find(params[:question_id])    
    @selection = @question.build_selection(RangeSelection, selection_params)
    if @selection.save
      flash[:success] = "Question added."
      redirect_to new_survey_question_path(@question.survey)
    else
      flash[:danger] = "Try that again."
      render :new
    end
  end

  def selection_params
    params.require(:range_selection).permit(:min, :max, :question_id)
  end
end
