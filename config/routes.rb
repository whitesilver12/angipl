Rails.application.routes.draw do
   root 'words#index'
   resources :words, only: [:index, :new, :create, :show]
end
