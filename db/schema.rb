# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131203164326) do

  create_table "alunos", force: true do |t|
    t.integer  "turma_id",   null: false
    t.string   "nome",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunos", ["turma_id"], name: "index_alunos_on_turma_id", using: :btree

  create_table "professors", force: true do |t|
    t.string   "nome",       null: false
    t.string   "formacao",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provas", force: true do |t|
    t.integer  "aluno_id",                 null: false
    t.decimal  "nota",       default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provas", ["aluno_id"], name: "index_provas_on_aluno_id", using: :btree

  create_table "turmas", force: true do |t|
    t.integer  "professor_id", null: false
    t.string   "nome",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turmas", ["professor_id"], name: "index_turmas_on_professor_id", using: :btree

  add_foreign_key "alunos", "turmas", name: "alunos_turma_id_fk"

  add_foreign_key "provas", "alunos", name: "provas_aluno_id_fk"

  add_foreign_key "turmas", "professors", name: "turmas_professor_id_fk"

end
