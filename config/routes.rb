# encoding: utf-8

require "tigron/backstage/dashboard_controller"

Tigron::Backstage::Engine.routes.draw do
  post "webconsole" => proc { |env| Rack::Webconsole::TigronRepl.new.call(env) }

  resources :server, only: [:index]
  resources :message_processors, only: [:index]
  resources :jobs, only: [:index]
  resources :queues, only: [:index, :show]
  resources :services, only: [:index]
  resources :console, only: [:index]
  resources :environment, only: [:index]
  resources :process, only: [:index]
  resources :cache, only: [:index]
  resources :threads, only: [:show]
  resources :system, only: [:index]

  root to: "dashboard#index"
end

