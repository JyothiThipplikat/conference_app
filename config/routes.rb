Rails.application.routes.draw do
 namespace :api do 
  get "/speaker_url" => "conferences#index"
  post "/speaker_url" => "conferences#create"
  get "/speaker_url/:id" => "conferences#show"
  patch "/speaker_url/:id" => "conferences#update"
  delete '/speaker_url/:id'=> "conferences#destroy"

  get "/meeting_url" => "meetings#index"
  post "/meeting_url" => "meetings#create"
  get "/meeting_url/:id" => "meetings#show"
  patch "/meeting_url/:id" => "meetings#update"
  delete "/meeting_url/:id" => "meetings#destroy"
 end
end
