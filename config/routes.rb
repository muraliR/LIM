Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/scrap', to: 'pages#scrap'
  get '/list', to: 'pages#list'

end
