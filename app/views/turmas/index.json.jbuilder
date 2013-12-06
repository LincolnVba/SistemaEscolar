
json.array!(@turmas) do |turma|
  json.extract! turma, :professor_id, :nome
  json.url turma_url(turma, format: :json)
end
