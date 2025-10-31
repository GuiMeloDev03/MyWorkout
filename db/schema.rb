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

ActiveRecord::Schema[8.0].define(version: 2025_10_31_172458) do
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

  create_table "dietas", force: :cascade do |t|
    t.string "nome"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dietas_on_user_id"
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
  add_foreign_key "dietas", "users"
  add_foreign_key "item_refeicaos", "alimentos"
  add_foreign_key "item_refeicaos", "dia_dietas"
end
