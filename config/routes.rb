Rails.application.routes.draw do
  get 'search' => 'search#search'

  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users

  devise_scope :user do
 		get 'users/:id/follows' => 'users#follows', as: 'follow_user'
 		get 'users/:id/followers' => 'users#followers', as: 'follower_user'
 	end

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only:[:create, :destroy]
  	resource :book_comments, only:[:create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as:'follow'
  delete 'unfollow/:id' => 'relationships#unfollow', as:'unfollow'

end