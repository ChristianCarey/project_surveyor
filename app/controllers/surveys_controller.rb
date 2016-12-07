class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.create(survey_params)
    if @survey.save
      flash[:success] = "Survey info complete. Time to add some questions."
      redirect_to new_survey_question_path(@survey)
    else
      flash[:danger] = "Oops! Let's try that again."
      render :new
    end
  end


  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
