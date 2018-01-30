Rails.application.routes.draw do
root to: 'tests#index'
  devise_for :users, path: '', path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'session'}

    namespace :admin do
      resources :gists
    root to: 'tests#index'
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end

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

  delete 'logout', to: 'sessions#destroy'
end
