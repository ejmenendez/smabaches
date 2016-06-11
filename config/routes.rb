Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Commontator::Engine => '/commontator'
  devise_for :users
  root 'publications#index'
  resources :publications do
    member do
      put 'like', to: 'publications#upvote'
      put 'dislike', to: 'publications#downvote'
    end
end

end
