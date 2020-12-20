Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about_us'
  get "about-us" => "pages#about_us", :as => "about_us"
  get "history" => "pages#history", :as => "history"
  get "leadership-team" => "pages#leadership_team", :as => "leadership_team"
  get "location-and-facilities" => "pages#location_and_facilities", :as => "location_and_facilities"
  get "our-philosophy" => "pages#our_philosophy", :as => "our_philosophy"
  get "principals-welcome" => "pages#principals_welcome", :as => "principals_welcome"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
