# Classe prova comunicando com a base de dados
class Prova < ActiveRecord::Base
  # Toda prova pertence a um aluno
  belongs_to :aluno

  #Chamando o método que verifica a nota ser  entre 0 e 10.
  validate :valida_nota

  def valida_nota
    errors.add(:nota, ' :Deve estar entre 0 e 10') if nota > 10  or nota < 0
  end

end
