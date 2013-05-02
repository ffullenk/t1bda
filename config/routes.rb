T1bda::Application.routes.draw do
  
  match "/carreras/buscar" => "carreras#buscar", :as => "buscar_carrera"
  match "/sedes/buscar" => "sedes#buscar", :as => "buscar_sede"
  match "/universidads/buscar" => "universidads#buscar", :as => "buscar_universidad"
  match "/exportar" => "home#exportar", :as => "exportar"
  match "/importar" => "home#importar", :as => "importar"
  
  resources :universidads
  resources :carreras
  resources :sedes
  root :to => "home#index"

end