Rails.application.routes.draw do
  resources :blogs
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'works/calender' => 'works#calender'
get 'works/tag' => 'works#tag'
get 'works/top' => 'works#top'

resources :diets do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
end

resources :works do
  resources :dislikes, only: [:create, :destroy]
  resources :nocomments, only: [:create]
end
root 'works#top'


resources :comments, only: [:create]
resources :users, only: [:show] 

end
