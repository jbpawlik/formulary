Rails.application.routes.draw do
  root to: 'welcome#welcome'
  resources :users do
    collection do
      post 'login'
    end
  end
  resources :medications do
  end
end
