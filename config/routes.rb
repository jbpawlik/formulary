Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users do
    collection do
      post 'login'
    end
  end
end
