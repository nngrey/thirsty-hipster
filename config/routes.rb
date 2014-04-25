ThirstyHipster::Application.routes.draw do
  root to: 'locations#index'
  devise_for :users
  resources :locations
  resources :comments

end


