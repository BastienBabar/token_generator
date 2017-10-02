Rails.application.routes.draw do
  namespace :admin do
    resources :companies
    resources :employees

    root to: "companies#index"
  end
end
