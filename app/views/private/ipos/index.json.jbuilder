json.array!(@ipos) do |ipo|
  json.extract! ipo, :id, :pre_ipo_id, :member_id, :amount, :count, :state
  json.url ipo_url(ipo, format: :json)
end
