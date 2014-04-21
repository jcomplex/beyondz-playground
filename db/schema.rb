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

ActiveRecord::Schema.define(version: 20140421195329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.string   "led_by"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "front_page_info"
    t.text     "details_summary"
    t.text     "details_content"
    t.string   "complete_module_url"
    t.string   "assignment_download_url"
    t.datetime "eal_due_date"
    t.text     "final_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "seo_name"
  end

  create_table "resources", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "note"
    t.boolean  "optional"
    t.integer  "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "assignment_id"
    t.string   "name"
    t.string   "kind"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id", using: :btree

  create_table "todos", force: true do |t|
    t.integer  "assignment_id"
    t.text     "content"
    t.integer  "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todos", ["assignment_id"], name: "index_todos_on_assignment_id", using: :btree

  create_table "user_assignments", force: true do |t|
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_assignments", ["assignment_id"], name: "index_user_assignments_on_assignment_id", using: :btree
  add_index "user_assignments", ["user_id"], name: "index_user_assignments_on_user_id", using: :btree

  create_table "user_submission_files", force: true do |t|
    t.integer  "submission_id"
    t.integer  "user_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  add_index "user_submission_files", ["submission_id"], name: "index_user_submission_files_on_submission_id", using: :btree
  add_index "user_submission_files", ["user_submission_id"], name: "index_user_submission_files_on_user_submission_id", using: :btree

  create_table "user_submissions", force: true do |t|
    t.integer  "user_assignment_id"
    t.integer  "submission_id"
    t.integer  "user_id"
    t.string   "kind"
    t.string   "file_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_submissions", ["submission_id"], name: "index_user_submissions_on_submission_id", using: :btree
  add_index "user_submissions", ["user_assignment_id"], name: "index_user_submissions_on_user_assignment_id", using: :btree
  add_index "user_submissions", ["user_id"], name: "index_user_submissions_on_user_id", using: :btree

  create_table "user_todos", force: true do |t|
    t.integer  "user_id"
    t.integer  "todo_id"
    t.boolean  "completed"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_todos", ["todo_id"], name: "index_user_todos_on_todo_id", using: :btree
  add_index "user_todos", ["user_id"], name: "index_user_todos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "coach"
    t.string   "documentKey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "reset_token"
    t.datetime "reset_expiration"
  end

end
