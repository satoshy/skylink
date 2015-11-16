json.array!(@films) do |film|
  json.extract! film, :id, :name, :description, :cover, :video
  json.url film_url(film, format: :json)
end
