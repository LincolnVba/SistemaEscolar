class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.references :turma, index: true, null: false
      t.string :nome, null: false

      t.timestamps
    end
    add_foreign_key(:alunos, :turmas)
  end
end
