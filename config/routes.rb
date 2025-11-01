Rails.application.routes.draw do
  devise_for :users
  resources :dietas do
    resources :refeicoes, except: [ :index ]
  end
  resources :treinos do
    resources :dia_treinos, except: [ :index ] do
      resources :exercicios_planos, only: [ :new, :create, :edit, :update, :destroy ]
    end
  end

  resources :exercicios

  # get "treinos/:treino_id/dia_treinos/:id", to: "dia_treinos#show", as: :treino_dia_treino

  root "dietas#index"
end
