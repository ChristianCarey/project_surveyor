class OptionsController < ApplicationController

  def new
    @selection = MultipleChoiceSelection.find(params[:multiple_choice_selection_id])
    @option = @selection.options.build
  end

  def create
    @selection = MultipleChoiceSelection.find(params[:multiple_choice_selection_id])
    @option = @selection.options.build(option_params)
    if @option.save
      flash[:success] = "Option added."
      redirect_to new_multiple_choice_selection_option_path(@selection)
    else
      flash[:danger] = "Try that again."
      render :new
    end
  end

  private

  def option_params
    params.require(:option).permit(:value, :multiple_choice_selection_id)
  end
end
