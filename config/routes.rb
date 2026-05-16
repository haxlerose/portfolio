Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "sitemap.xml", to: "sitemaps#show", defaults: { format: :xml }
  get "robots.txt", to: "robots#show", defaults: { format: :text }

  get "admin" => "admin#index", as: :admin

  get "blogs", to: "blogs#index"
  get "blogs/:slug", to: "blogs#show", as: :blog_post
end
