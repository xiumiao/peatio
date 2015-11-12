json.array!(@ipo_numbers) do |ipo_number|
  json.extract! ipo_number, :id, :ipo_id
  json.url ipo_number_url(ipo_number, format: :json)
end
