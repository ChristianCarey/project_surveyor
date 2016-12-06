class ResponsesController < ApplicationController
  def new
    @survey  = Survey.find(params[:survey_id])
    @response = @survey.responses.build
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build(response_params)
    if @survey.save      
      redirect_to :root
    else
      @survey = @response.survey
      render 'new'
    end
  end

  private

  def response_params
    params.require(:response).
      permit( { numeric_answers_attributes: [
                :id,
                :value,
                :selection_id,
                :response_id ] },
              { multiple_choice_answers_attributes: [
                :id,
                :option_id,
                :selection_id,
                :response_id
                ] } )
  end
end
