json.array!(@sound_bites) do |sound_bite|
  json.extract! sound_bite, :id, :title, :transcript, :length, :audiofile, :recording_date
  json.url sound_bite_url(sound_bite, format: :json)
end
