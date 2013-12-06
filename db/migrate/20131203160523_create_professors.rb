class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :nome, null: false
      t.string :formacao, null: false

      t.timestamps
    end
  end
end
