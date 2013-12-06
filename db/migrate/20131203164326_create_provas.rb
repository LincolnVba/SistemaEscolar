class CreateProvas < ActiveRecord::Migration
  def change
    create_table :provas do |t|
      t.references :aluno, index: true, null: false
      t.decimal :nota, null: false, default: 0

      t.timestamps
    end
    add_foreign_key(:provas, :alunos)
  end
end
