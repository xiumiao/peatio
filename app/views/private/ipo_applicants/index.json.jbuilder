json.array!(@ipo_applicants) do |ipo_applicant|
  json.extract! ipo_applicant, :id, :production, :base_unit, :issue_price, :total_stock, :ipo_count, :top_limit, :start_time, :end_time, :state, :member_id, :audit_id, :audit_time
  json.url ipo_applicant_url(ipo_applicant, format: :json)
end
