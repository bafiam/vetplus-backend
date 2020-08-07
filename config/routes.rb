# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :user, only: [:create]
      resources :login, only: %i[create index]
      resources :logout, only: [:index]
      resources :vet, only: %i[index create]
      resources :profile, only: %i[index create]
    end
  end
end
