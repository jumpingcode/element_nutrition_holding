ElementNutritionHolding::Application.routes.draw do
  root 'welcome#index'

  post '/sign-up', to: 'welcome#signup', as: :create_user
  get '/thanks', to: 'welcome#signup_success', as: :created_user
end
