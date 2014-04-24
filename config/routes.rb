ThirstyHipster::Application.routes.draw do
  devise_for :users
  resources :locations
end
