Rails.application.routes.draw do

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :products
  resources :orders
  devise_for :users, :controllers => {:registrations =>  "registrations", sessions: 'sessions'}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  devise_scope :user do
    delete 'signout',  to: 'devise/sessions#destroy'
  end
  # root "dashboards#show"
  root "products#index"
  resource :users
  resource :dashboards
end
