Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # devise_for :users

  root 'foods#index'
  resources :foods, only: [:index, :create, :destroy, :new]

  resources :recipe_foods, only: [:update, :edit]

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
  resources :recipe_foods, only: [:new, :create, :destroy]
  end

  get 'public_recipes', to: 'recipes#public_recipes'
  get 'general_shopping_list', to: 'general_shopping_lists#index', as: 'general_shopping_list'

end
