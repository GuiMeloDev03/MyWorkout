# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_31_180731) do
  create_table "alimentos", force: :cascade do |t|
    t.string "nome"
    t.integer "calorias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dia_dietas", force: :cascade do |t|
    t.string "nome"
    t.integer "dieta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dieta_id"], name: "index_dia_dietas_on_dieta_id"
  end

  create_table "dia_treinos", force: :cascade do |t|
    t.string "nome"
    t.integer "treino_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treino_id"], name: "index_dia_treinos_on_treino_id"
  end

  create_table "dietas", force: :cascade do |t|
    t.string "nome"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dietas_on_user_id"
  end

  create_table "exercicio_planos", force: :cascade do |t|
    t.integer "dia_treino_id", null: false
    t.integer "exercicio_id", null: false
    t.integer "series"
    t.integer "repeticoes"
    t.decimal "carga_planejada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dia_treino_id"], name: "index_exercicio_planos_on_dia_treino_id"
    t.index ["exercicio_id"], name: "index_exercicio_planos_on_exercicio_id"
  end

  create_table "exercicios", force: :cascade do |t|
    t.string "nome"
    t.string "grupo_muscular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_refeicaos", force: :cascade do |t|
    t.integer "alimento_id", null: false
    t.integer "dia_dieta_id", null: false
    t.decimal "quantidade"
    t.string "unidade_medida"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alimento_id"], name: "index_item_refeicaos_on_alimento_id"
    t.index ["dia_dieta_id"], name: "index_item_refeicaos_on_dia_dieta_id"
  end

  create_table "treinos", force: :cascade do |t|
    t.string "nome"
    t.string "objetivo"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_treinos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dia_dietas", "dietas"
  add_foreign_key "dia_treinos", "treinos"
  add_foreign_key "dietas", "users"
  add_foreign_key "exercicio_planos", "dia_treinos"
  add_foreign_key "exercicio_planos", "exercicios"
  add_foreign_key "item_refeicaos", "alimentos"
  add_foreign_key "item_refeicaos", "dia_dietas"
  add_foreign_key "treinos", "users"
end
