Rails.application.routes.draw do

  resources :paycheck_adjustments
  resources :paychecks
  resources :payrolls
  resources :recurring_adjustments
  resources :departments
  resources :employees
  resources :tickets
  resources :companies

  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'

end
