Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'
  get "about-us" => "our_school#about_us", :as => "about_us"
  get "history" => "our_school#history", :as => "history"
  get "leadership-team" => "our_school#leadership_team", :as => "leadership_team"
  get "location-and-facilities" => "our_school#location_and_facilities", :as => "location_and_facilities"
  get "our-philosophy" => "our_school#our_philosophy", :as => "our_philosophy"
  get "principals-welcome" => "our_school#principals_welcome", :as => "principals_welcome"
  get "school-policies" => "our_school#school_policies", :as => "school_policies"
  get "video-gallery" => "our_school#video_gallery", :as => "video_gallery"


  get "sport" => "beyond_classroom#sport", :as => "sport"
  get "curriculum" => "beyond_classroom#curriculum", :as => "curriculum"
  get "art" => "beyond_classroom#art", :as => "art"
  get "exchange-program" => "beyond_classroom#exchange_program", :as => "exchange_program"
  get "study-tour" => "beyond_classroom#study_tour", :as => "study_tour"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
