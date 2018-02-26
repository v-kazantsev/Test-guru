Rails.application.routes.draw do
  get 'pages/feedback'
  get 'pages/index'
  post 'pages/create', as: 'feedback'

root to: 'pages#index'
  devise_for :users, path: '', path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'session'}

    namespace :admin do
      resources :gists, only: [:index, :destroy]
      resources :badges
      root to: 'tests#index'
      resources :tests do
        patch :update_inline, on: :member
        resources :questions, shallow: true do
          resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :badges, only: :index
    get 'badges/user_badges', to: 'badges#user_badges'

  resources :tests, only: :index do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  post '/test_passages/:id', to: 'test_passages#end_by_timeout'

  delete 'logout', to: 'sessions#destroy'
end
