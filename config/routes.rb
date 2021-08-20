Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]

  # get 'lists/index'
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:id', to: 'lists#show', as: 'list'
  # get 'lists/create'
  # get 'movies/index'

  root to: 'lists#index'
  resources :lists, except: [:index] do
    resources :bookmarks, only: [:create, :new]
  end
end
