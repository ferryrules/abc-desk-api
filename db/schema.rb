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

ActiveRecord::Schema.define(version: 2019_09_11_031120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comp_users", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_comp_users_on_company_id"
    t.index ["user_id"], name: "index_comp_users_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "payroll_freq"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.string "pay_type"
    t.float "pay_rate"
    t.string "active_status", default: "Active"
    t.string "filing_status"
    t.integer "w4_allowance", default: 0
    t.bigint "company_id"
    t.string "title"
    t.string "to_currency"
    t.string "fname"
    t.string "lname"
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "paycheck_adjustments", force: :cascade do |t|
    t.string "adj_type"
    t.float "adj_amount"
    t.string "description"
    t.bigint "paycheck_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_paycheck_adjustments_on_employee_id"
    t.index ["paycheck_id"], name: "index_paycheck_adjustments_on_paycheck_id"
  end

  create_table "paychecks", force: :cascade do |t|
    t.float "hours", default: 0.0
    t.float "ot_hours", default: 0.0
    t.float "pto_hours", default: 0.0
    t.float "vacation_hours", default: 0.0
    t.float "holiday_hours", default: 0.0
    t.float "sick_hours", default: 0.0
    t.bigint "payroll_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_paychecks_on_employee_id"
    t.index ["payroll_id"], name: "index_paychecks_on_payroll_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.string "payroll_status", default: "Not Started"
    t.date "start_date"
    t.date "end_date"
    t.date "check_date"
    t.bigint "company_id"
    t.integer "cash_req"
    t.index ["company_id"], name: "index_payrolls_on_company_id"
  end

  create_table "recurring_adjustments", force: :cascade do |t|
    t.string "adj_type"
    t.float "adj_amount"
    t.string "description"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_recurring_adjustments_on_employee_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "priority"
    t.string "category"
    t.bigint "company_id"
    t.bigint "user_id"
    t.string "ticket_status"
    t.string "updates"
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "updates", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id"
    t.index ["ticket_id"], name: "index_updates_on_ticket_id"
    t.index ["user_id"], name: "index_updates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "permission"
  end

  add_foreign_key "comp_users", "companies"
  add_foreign_key "comp_users", "users"
  add_foreign_key "departments", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "paycheck_adjustments", "employees"
  add_foreign_key "paycheck_adjustments", "paychecks"
  add_foreign_key "paychecks", "employees"
  add_foreign_key "paychecks", "payrolls"
  add_foreign_key "payrolls", "companies"
  add_foreign_key "recurring_adjustments", "employees"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "users"
  add_foreign_key "updates", "tickets"
  add_foreign_key "updates", "users"
end
