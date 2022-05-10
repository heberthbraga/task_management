Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  get 'dashboard/index'
  
  root 'home#index'
end
