Rails.application.routes.draw do
  #Administrador
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #Gema para comentar las publicaciones
  mount Commontator::Engine => '/commontator'

  #Autorización de ingreso
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  # ruta raíz
  root 'publications#index'

  #para los likes/dislikes de las publicaciones
  resources :publications do
    member do
      put 'like', to: 'publications#upvote'
      put 'dislike', to: 'publications#downvote'
    end
  end
end
