Rails.application.routes.draw do
  root 'todos#index'

  resources :todos do
    member do
      patch :complete
    end  
  end
end 