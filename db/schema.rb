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

ActiveRecord::Schema[7.1].define(version: 20_240_523_025_840) do # rubocop:disable Metrics/BlockLength
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.decimal "value", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "status", default: false
    t.index ["portfolio_id"], name: "index_contributions_on_portfolio_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index %w[slug sluggable_type scope], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index %w[slug sluggable_type], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index %w[sluggable_type sluggable_id], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.decimal "applied_value", default: "0.0"
    t.decimal "gross_balance", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index %w[name resource_type resource_id], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index %w[resource_type resource_id], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.date "birthdate", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "portfolio_id"
    t.float "participation", default: 0.0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["portfolio_id"], name: "index_users_on_portfolio_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index %w[user_id role_id], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "contributions", "portfolios"
  add_foreign_key "contributions", "users"
  add_foreign_key "users", "portfolios"
end
