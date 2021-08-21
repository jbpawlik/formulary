Rails.application.routes.draw do
  root to: 'welcome#welcome'
  resources :users do
    collection do
      post 'login'
    end
  end
  resources :medications do
    collection do
      get "random_search"
    end
  end
end
