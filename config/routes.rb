Rails.application.routes.draw do
  root 'surveys#index'

  resources :surveys do 
    resources :responses
  end

  resources :multiple_choice_answers
  resources :numeric_answers
end
