Rails.application.routes.draw do
  root to: 'welcome#welcome'
  resources :users do
    resources :medications do
    end
    collection do
      post 'login'
    end
  end
end
