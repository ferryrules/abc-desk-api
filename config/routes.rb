Rails.application.routes.draw do
  
  resources :paycheck_adjustments
  resources :paychecks
  resources :payrolls
  resources :recurring_adjustments
  resources :departments
  resources :employees
  resources :tickets
  resources :companies

  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

end
