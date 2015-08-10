json.array!(@items) do |item|
  json.extract! item, :id, :name, :age, :sex
  json.url item_url(item, format: :json)
end
