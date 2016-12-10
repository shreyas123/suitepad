Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/random_quote' => 'quotes#random_quote'
  root 'quotes#index'
end
