Rails.application.routes.draw do

  resources :candidates

  get '/hello.php', to: 'candidates#index'
end
