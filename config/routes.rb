Rails.application.routes.draw do
 namespace :api do 
  get "/speaker_url" => "conferences#speaker"
  get "/meeting_url" => "meetings#meeting"
  get "first_meeting_url" => "meetings#first_meeting"
  get "second_meeting_url" => "meetings#second_meeting"
  get "last_meeting_url" => "meetings#last_meeting"

  #Rendered all, first,second, and last meetings
 end
end
