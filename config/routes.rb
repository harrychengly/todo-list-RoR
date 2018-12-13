Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :listings
    end 
  end
  
  #set index page /root url
  root 'pages#home'
  get 'pages/about'
  get 'pages/home'
  get 'pages/contact'
  post 'pages/create'
end
