# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get 'manage', to: 'manage/sessions#new', as: :manage

  namespace :manage do
    resource :session, only: %i[new create destroy]
    resources :videos, only: %i[index]
  end
end
