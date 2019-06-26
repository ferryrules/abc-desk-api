Rails.application.routes.draw do

  resources :comp_users
  resources :users
  resources :paycheck_adjustments
  resources :paychecks
  resources :payrolls
  resources :recurring_adjustments
  resources :departments
  resources :employees
  resources :tickets
  resources :companies

  resources :users, only: %i[create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

end
