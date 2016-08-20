Rails.application.routes.draw do
  resources :patients
  resources :doctors
  resources :irenas do
   get 'check', on: :collection
   
   get 'patients', on: :collection
   
 end
  
  
  root 'doctors#index'
  
end
