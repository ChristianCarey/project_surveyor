Survey.destroy_all
SelectionType.destroy_all

MULTIPLIER = 1
SURVEY_NUM = 20
QUESTIONS_PER_SURVEY = 15
SELECTION_TYPES = [
                    { class_name: 'MultipleChoiceSelection', 
                      string_version: 'Multiple Choice' }, 
                    { class_name: 'RangeSelection', 
                      string_version: 'Number Range'}
                  ]

SELECTION_TYPES.each do |params|
  SelectionType.create(params)
end

(SURVEY_NUM * MULTIPLIER).times do 
  Survey.create(title: Faker::Company.catch_phrase,
                description: Faker::Lorem.paragraph)
end

Survey.all.each do |survey|
  QUESTIONS_PER_SURVEY.times do |n|
    prompt   = "#{Faker::Company.bs}?"
    required = n % 4 != 0
    selection_type_id = SelectionType.all.sample.id
    Question.create(prompt: prompt,
                    required: required,
                    selection_type_id: selection_type_id,
                    survey_id: survey.id)
  end
end

Question.all.each_with_index do |question, index|
  if question.selection_class == MultipleChoiceSelection
    multiple = index % 3 == 0
    MultipleChoiceSelection.create( multiple: multiple,
                                    question_id: question.id)
  elsif question.selection_class == RangeSelection
    min = rand(0..5)
    max = rand(10..20)
    RangeSelection.create(min: min, max: max, 
                          question_id: question.id)
  end
end

MultipleChoiceSelection.all.each do |selection|
  4.times do 
    Option.create(value: Faker::Company.buzzword,
                  multiple_choice_selection_id: selection.id)
  end
end

Survey.all.each do |survey|
  rand(3..7).times do 
    Response.create(survey_id: survey.id)
  end
end

Response.all.each do |response|
  response.survey.questions.each do |question|
    if question.selection_class == MultipleChoiceSelection
      option_id = question.selection.options.sample.id
      MultipleChoiceAnswer.create(response_id: response.id,
                                  selection_id: question.selection.id,
                                  option_id:   option_id)
    elsif question.selection_class == RangeSelection 
      value = rand(question.selection.min..question.selection.max)
      NumericAnswer.create(response_id: response.id,
                           selection_id: question.selection.id,
                           selection_type: RangeSelection,
                           value: value )
    end
  end
end