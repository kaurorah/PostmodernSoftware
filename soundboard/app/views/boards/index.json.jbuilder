json.array!(@boards) do |board|
  json.extract! board, :id, :title, :transcript, :length, :audiofile, :recording_date
  json.url board_url(board, format: :json)
end
