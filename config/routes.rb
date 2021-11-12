Rails.application.routes.draw do
  root to: 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:show , :create, :new] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
