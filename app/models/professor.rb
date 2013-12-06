# Classe Professor comunicando com a base de dados
class Professor < ActiveRecord::Base

  #. se o usuário tentar deletar um professor antes de deletar as turmas pertencentes a ele, ele não o faz,
  # restrict: evita de a página mostrar  erros de banco de dados
  has_many :turmas , dependent: :restrict_with_error

  #. Nome e Formação do Professor como campos obrigatórios
  validates_presence_of :nome, :formacao
end
