json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :device_name, :code_name, :available
  json.url equipment_url(equipment, format: :json)
end
