class AddUserstoDb < ActiveRecord::Migration[5.2]
  def change
    create_table "users", force: :cascade do |t|
      t.string "email"
      t.string "password_digest"
      t.integer "employee_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["employee_id"], name: "index_users_on_employee_id"
    end
  end
end
