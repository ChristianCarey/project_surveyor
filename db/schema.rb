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

ActiveRecord::Schema.define(version: 20161206182225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "multiple_choice_answers", force: :cascade do |t|
    t.integer  "response_id"
    t.integer  "option_id"
    t.integer  "selection_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["option_id"], name: "index_multiple_choice_answers_on_option_id", using: :btree
    t.index ["response_id"], name: "index_multiple_choice_answers_on_response_id", using: :btree
  end

  create_table "multiple_choice_selections", force: :cascade do |t|
    t.boolean  "multiple"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_multiple_choice_selections_on_question_id", using: :btree
  end

  create_table "numeric_answers", force: :cascade do |t|
    t.integer  "selection_id"
    t.float    "value"
    t.integer  "response_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "selection_type"
    t.index ["response_id"], name: "index_numeric_answers_on_response_id", using: :btree
    t.index ["selection_id", "selection_type"], name: "index_numeric_answers_on_selection_id_and_selection_type", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "value"
    t.integer  "multiple_choice_selection_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["multiple_choice_selection_id"], name: "index_options_on_multiple_choice_selection_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "prompt"
    t.boolean  "required"
    t.integer  "selection_type_id"
    t.integer  "survey_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "range_selections", force: :cascade do |t|
    t.integer  "min"
    t.integer  "max"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_range_selections_on_question_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id", using: :btree
  end

  create_table "selection_types", force: :cascade do |t|
    t.string   "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "multiple_choice_answers", "options"
  add_foreign_key "multiple_choice_answers", "responses"
  add_foreign_key "multiple_choice_selections", "questions"
  add_foreign_key "numeric_answers", "responses"
  add_foreign_key "options", "multiple_choice_selections"
  add_foreign_key "questions", "surveys"
  add_foreign_key "range_selections", "questions"
  add_foreign_key "responses", "surveys"
end
