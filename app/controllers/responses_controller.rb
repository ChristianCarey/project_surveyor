class ResponsesController < ApplicationController
  def new
    @survey  = Survey.find(params[:survey_id])
    @response = @survey.responses.build
  end
end
