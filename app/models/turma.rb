# Classe turma comunicando a base de dados
class Turma < ActiveRecord::Base
  # Uma turma pertence a um professor
  belongs_to :professor

  #. se o usuário tentar deletar uma turma antes de deletar os alunos pertencentes a ela, ele não o faz,
  # restrict: evita de a página mostrar  erros de banco de dados
  has_many :alunos, dependent: :restrict_with_error

  #. Professor que leciona a turma, nome da turma são itens obrigatórios.
  validates_presence_of :professor_id, :nome
end
