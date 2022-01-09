Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :animes
   resources :customers, only: [:show, :edit, :update]
    get 'home/about' => 'homes#about'
end