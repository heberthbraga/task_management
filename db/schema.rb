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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_160456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_categories", id: false, force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "category_id"
    t.index ["activity_id", "category_id"], name: "index_activities_categories_on_activity_id_and_category_id", unique: true
    t.index ["activity_id"], name: "index_activities_categories_on_activity_id"
    t.index ["category_id"], name: "index_activities_categories_on_category_id"
  end

  create_table "activity_statuses", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id", "name"], name: "index_activity_statuses_on_activity_id_and_name", unique: true
    t.index ["activity_id"], name: "index_activity_statuses_on_activity_id"
    t.index ["name"], name: "index_activity_statuses_on_name"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "invitation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_invitation_types_on_name"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "task_invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "task_id", null: false
    t.bigint "invitation_type_id", null: false
    t.datetime "send_date"
    t.text "text_response"
    t.datetime "response_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_type_id"], name: "index_task_invitations_on_invitation_type_id"
    t.index ["send_date"], name: "index_task_invitations_on_send_date"
    t.index ["task_id"], name: "index_task_invitations_on_task_id"
    t.index ["user_id", "task_id", "send_date"], name: "index_task_invitations_on_user_id_and_task_id_and_send_date"
    t.index ["user_id"], name: "index_task_invitations_on_user_id"
  end

  create_table "task_statuses", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_task_statuses_on_name"
    t.index ["task_id", "name"], name: "index_task_statuses_on_task_id_and_name", unique: true
    t.index ["task_id"], name: "index_task_statuses_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "priority"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_tasks_on_end_date"
    t.index ["start_date"], name: "index_tasks_on_start_date"
    t.index ["title", "start_date", "end_date"], name: "index_tasks_on_title_and_start_date_and_end_date"
    t.index ["title"], name: "index_tasks_on_title"
  end

  create_table "tasks_participants", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "task_id"
    t.index ["task_id"], name: "index_tasks_participants_on_task_id"
    t.index ["user_id", "task_id"], name: "index_tasks_participants_on_user_id_and_task_id", unique: true
    t.index ["user_id"], name: "index_tasks_participants_on_user_id"
  end

  create_table "user_statuses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_statuses_on_name"
    t.index ["user_id", "name"], name: "index_user_statuses_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_user_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "gender"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "activity_statuses", "activities"
  add_foreign_key "task_invitations", "invitation_types"
  add_foreign_key "task_invitations", "tasks"
  add_foreign_key "task_invitations", "users"
  add_foreign_key "task_statuses", "tasks"
  add_foreign_key "user_statuses", "users"
end
