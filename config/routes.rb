Bloccit::Application.routes.draw do

  get "comments/new"

  get "comments/create"

  get "comments/show"

  get "new/create"

  get "new/show"

  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

 end
