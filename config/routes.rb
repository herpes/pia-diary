PiaDiary::Application.routes.draw do
  resources :composers


  resources :songs


  resources :practices

  get '/' => "top#index"
  
end
