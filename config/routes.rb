Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
    resources :items, only: [:index, :show]
    get 'customers/my_page' => "customers#show", as: "my_page"
    get 'customers/information/edit' => "customers#edit"
    patch 'customers/information' => "customers#update"
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :cart_items, only: [:index, :create, :update]
    delete 'cart_items/destroy_all'
    delete 'cart_items/:id' => "cart_items#destroy"


    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :comfirm
        get :complete
      end
    end

  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]

  end



  devise_for :admin, skip: [:passwords], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
