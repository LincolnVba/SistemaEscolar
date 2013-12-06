class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.references :professor, index: true, null: false
      t.string :nome, null: false

      t.timestamps
    end

    add_foreign_key(:turmas, :professors)
  end
end
