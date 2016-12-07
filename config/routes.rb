Rails.application.routes.draw do
  root 'surveys#index'

  resources :surveys do 
    resources :responses
    resources :questions
  end

  resources :questions do 
    resources :multiple_choice_selections
    resources :range_selections
  end

  resources :multiple_choice_selections do 
    resources :options  
  end
  
  resources :multiple_choice_answers
  resources :numeric_answers
end
