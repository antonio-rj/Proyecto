json.array!(@offices) do |office|
  json.extract! office, :id, :office_number, :department
  json.url office_url(office, format: :json)
end
