Rails.application.routes.draw do

  resources :comp_users
  resources :users
  resources :companies
  resources :employees
  resources :departments
  resources :recurring_adjustments
  resources :paycheck_adjustments
  resources :paychecks
  resources :payrolls
  resources :tickets
  #
  # resources :users do
  #   resources :companies do
  #     resources :tickets
  #   end
  # end
  #
  # resources :users do
    resources :companies do
      resources :employees do
        resources :departments
        resources :recurring_adjustments
      end
    end
  # end
  #
  # resources :users do
  #   resources :companies do
  #     resources :payrolls do
  #       resources :paychecks do
  #         resources :paycheck_adjustments
  #       end
  #     end
  #   end
  # end



  resources :users, only: %i[create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

end
