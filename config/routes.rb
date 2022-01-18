Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'comments/index'
  devise_for :customers
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :animes do
    resources :post, only: [:create, :destroy]
    resources :comments, only: [:index]
    resource :bookmarks, only: [:create, :destroy]#後で変更
     collection do
      get :bookmarks
    end
   end
   resources :customers, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    #get 'followings' => 'relationships#followings', as: 'followings'
   # get 'followers' => 'relationships#followers', as: 'followers'
     member do
      get :follows, :follows
      get :followers, :followers
       
     end
   end
   get 'home/about' => 'homes#about'

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  
  Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
     resources :animes, only: %i[index]
    end 
  end 
end
end