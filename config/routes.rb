ThirstyHipster::Application.routes.draw do
  devise_for :users
  resources :locations
  resources :comments

  root to: 'locations#index'
end


