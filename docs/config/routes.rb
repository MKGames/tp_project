Rails.application.routes.draw do
  get 'subscriptions/signup'
  get 'subscriptions/expire'
  get 'subscriptions/remove'
  get 'documents/index'
  get 'documents/new'
  get 'documents/create'
  get 'documents/destroy'
  devise_for :users
  get 'welcome/index'
#root 'welcome#index'
resources :documents, only: [:index, :new, :create, :destroy]
   root "documents#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
