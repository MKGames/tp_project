Rails.application.routes.draw do
  get 'answer_controller/answer'
  get 'subscriptions/signup'
  post 'subscriptions/signup'
  get 'subscriptions/expire'
  get 'subscriptions/remove'
  get 'documents/index'
  get 'documents/new'
  get 'documents/create'
  get 'documents/destroy'
  get 'documents/:id' => 'documents#show', :as => 'id'
  devise_for :users
  get 'welcome/index'
  root 'documents#index'
resources :documents, only: [:index, :new, :create, :destroy]
   #root "documents#index"
  get '/signup' => 'subscriptions_controller#signup', :as => 'signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
