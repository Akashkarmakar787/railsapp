Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


root   'welcome#home'
get 'homepage', to: 'homepage#hp'
resources :articles
end
