Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Commontator::Engine => '/commontator'
  devise_for :users
  root 'publications#index'
  resources :publications

end
