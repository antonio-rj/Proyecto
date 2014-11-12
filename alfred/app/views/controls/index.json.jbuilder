json.array!(@controls) do |control|
  json.extract! control, :id, :returned_at
  json.url control_url(control, format: :json)
end
