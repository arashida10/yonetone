Rails.application.routes.draw do
  devise_for :users
  devise_for :admins


  get '/', to: 'home#top'

  namespace :admin do
    root to: 'dashboard#index'
    resources :dashboard do
      collection do
        get :shop_login, path: 'shop-login'
      end
    end

    # 管理者
    resources :admins, path: 'administrators'
    # 一般ユーザー
    resources :users do
      collection do
        get :search
        post :search
      end
    end

    resources :shops do
      member do
        get :auth
        get :auth_confirm
      end
      resources :products
    end

    # ショップロール
    resources :shop_admins
  end

  resources :shops do
    collection do
      get 'search'
    end
  end

end
