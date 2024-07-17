Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'index', to: 'checkout#index', as: 'checkout_index'
    get 'guest', to: 'checkout#guest', as: 'checkout_guest'
    post 'save_guest_address', to: 'checkout#save_guest_address', as: 'save_guest_address'
  end

  resources :customers, only: [:show]
  devise_for :customers

  get 'home/index'

  get 'page/:permalink', to: 'pages#show', as: 'permalink_page'
  resources :pages, only: [:edit, :update], param: :permalink
  get '/contact', to: 'pages#show', defaults: { permalink: 'contact' }, as: 'contact_page'
  get '/about', to: 'pages#show', defaults: { permalink: 'about' }, as: 'about_page'
  post '/contact', to: 'contacts#create', as: 'contact_submit'

  post 'contact', to: 'pages#contact', as: 'contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :orders, only: [:index, :show]

  resources :types do
    # resources :products, only: :index
  end

  resources :brands do
    # resources :products, only: :index
  end

  resources :categories do
    # resources :products, only:[ :index, :show]
  end

  resources :tags do
    # resources :products, only: [:index, :show]
  end

  resources :products do
    collection do
      get 'filter'
      get 'filter_by_category'
      get 'search'
    end

    member do
      post 'add_to_cart'
    end
  end

  get 'cart', to: 'carts#show'
  put 'cart/update', to: 'carts#update'
  delete 'cart/remove', to: 'carts#remove'

  namespace :admin do
    resources :pages, only: [:edit, :update]
  end

  get 'pages/contact', to: 'pages#show', defaults: { permalink: 'contact' }
  get 'pages/about', to: 'pages#show', defaults: { permalink: 'about' }
  get '/about', to: 'pages#about'
  get ':permalink', to: 'pages#show', as: :dynamic_page

  root 'home#index'
end
