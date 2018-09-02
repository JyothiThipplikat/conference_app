Rails.application.routes.draw do
 namespace :api do 
  get "/speaker_url" => "conferences#speaker"
 end
end
