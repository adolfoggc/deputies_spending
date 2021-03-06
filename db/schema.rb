# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_25_020411) do

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.integer "deputy_id"
    t.string "party"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "federal_unity"
    t.string "cpf"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "deputy_id", null: false
    t.string "description"
    t.string "specific_description"
    t.string "seller"
    t.string "cnpj_cpf"
    t.string "number"
    t.integer "document_kind"
    t.date "issue_date"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.index ["deputy_id"], name: "index_invoices_on_deputy_id"
  end

  add_foreign_key "invoices", "deputies"
end
