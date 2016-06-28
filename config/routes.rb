Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Commontator::Engine => '/commontator'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'publications#index'
  resources :publications do
    member do
      put 'like', to: 'publications#upvote'
      put 'dislike', to: 'publications#downvote'
    end
end

end
