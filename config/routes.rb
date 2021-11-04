Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users


  resources :books, only: [:create, :index, :show, :destroy, :edit,:update]
  resources :users, only: [:update, :index, :show, :edit]
get 'home/about'=>'homes#about'
end


