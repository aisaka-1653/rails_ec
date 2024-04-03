# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show]
  resources :carts, only: %i[show create destroy]
  namespace :admin do
    resources :products, only: %i[index new edit create update destroy]
  end

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
end
