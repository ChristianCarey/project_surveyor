class MultipleChoiceSelectionsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])    
    @selection = @question.build_selection(MultipleChoiceSelection, 
                                           { question_id: @question.id})
  end

  def create
    @question = Question.find(params[:question_id])    
    @selection = @question.build_selection(MultipleChoiceSelection, selection_params)
    if @selection.save
      redirect_to new_multiple_choice_selection_option_path(@selection)
    else
      flash[:danger] = "Try that again."
      render :new
    end
  end

  def selection_params
    params.require(:multiple_choice_selection).permit(:multiple, :question_id)
  end
end
