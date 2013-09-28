Bloccit::Application.routes.draw do

  get "comments/new"

  get "comments/create"

  get "comments/show"

  get "new/create"

  get "new/show"

  devise_for :users,  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
      match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

 end
