T1bda::Application.routes.draw do
  resources :universidads


  resources :carreras


  resources :sedes


  root :to => "home#index"


  match "/exportar" => "home#exportar", :as => "exportar"
end
