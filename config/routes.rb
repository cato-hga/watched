Rails.application.routes.draw do
  root 'episodes#index'
  post 'marked_as_watched/:id' => 'episodes#marked_as_watched', as: :watched
  devise_for :users
  get 'users/profile', to: 'users#show'


end
