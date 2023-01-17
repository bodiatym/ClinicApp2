# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :doctors
    resources :patients
    resources :doctor_categories
    resources :appointments

    root to: 'users#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :appointments, only: %i[create index new]

  namespace :appointments do
    resources :recommendations, only: %i[create index new]
  end

  resources :doctor_categories, only: :show

  root 'pages#home'

  get '/home' => 'pages#home'

  scope module: 'profiles' do
    resources :doctor_profiles, only: %i[show index]
    resource :patient_profiles, only: :show
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
