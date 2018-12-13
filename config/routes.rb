Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :listings
    end 
  end
  # resources: pages
  #set index page /root url
  root 'pages#home'
  get 'pages/about'
  get 'pages/home'
  get 'pages/contact'
  post 'pages/create'
  delete 'pages/destroy'
end
