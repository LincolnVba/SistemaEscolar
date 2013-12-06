
json.array!(@professors) do |professor|
  json.extract! professor, :nome, :formacao
  json.url professor_url(professor, format: :json)
end
