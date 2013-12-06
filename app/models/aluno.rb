#.Classe comunicando com a gem ActiveRecord para comunicação com banco de dados
class Aluno < ActiveRecord::Base
    #. Indicação de que uma aluno pertence a uma turma
    belongs_to :turma

  #. Indicação de que ao deletar uma aluno, deleta-se as provas deleta-se a prova dele
  has_many :provas, dependent: :delete_all
  accepts_nested_attributes_for :provas, :allow_destroy => true

  #. nome e turma de aluno são campos obrigatórios
  validates_presence_of :nome, :turma_id
  # as provas estão associdas a aluno
  validates_associated :provas

  #. Método para verificar a situação do aluno:
  # Provas Incompletas: O aluno só fez 3 provas.
  # Aprovado: Média > que 6
  # Reprovado: Média <= a 6.
  def situacao
    return "Provas Incompletas" if self.provas.count < 4
    self.provas.sum(&:nota) / 4 > 6.0 ? "Aprovado" : "Reprovado"
  end

end
