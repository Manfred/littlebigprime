# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  get 'manage', to: 'manage/pages#index', as: :manage

  resource :session, only: %i[new create destroy]
  resources :videos, only: %i[index show]

  namespace :manage do
    resources :passwords, only: %i[new index create edit update]
    resource :session, only: %i[new create destroy]
    resources :videos, only: %i[index]
    resources :uploads, onlu: %i[new create]
  end
end
