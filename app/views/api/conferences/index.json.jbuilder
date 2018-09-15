json.array! @speakers.each do |speaker|
  json.partial! "speaker.json.jbuilder", speaker: speaker
end