Rails.application.routes.draw do
  resources :paycheck_adjustments
  resources :paychecks
  resources :payrolls
  resources :recurring_adjustments
  resources :departments
  resources :employees
  resources :tickets
  resources :users
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
