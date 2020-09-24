Rails.application.routes.draw do


  resources :promos do          #notebooks
    resources :classrooms do    #pages
      resources :students       #checklists

    end
  end

  devise_for :users, controllers: { registrations: "users/registrations"}
  root to:'promos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
