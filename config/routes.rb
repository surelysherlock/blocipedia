Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create, :edit]

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
