Rails.application.routes.draw do
  root 'tweets#index'
  get 'tweets/index'

  get 'tweets/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
