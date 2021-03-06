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

ActiveRecord::Schema.define(version: 20150303083119) do

  create_table "domains", force: :cascade do |t|
    t.string "name",        limit: 255, null: false
    t.string "description", limit: 255
  end

  add_index "domains", ["name"], name: "index_domains_on_name", using: :btree

  create_table "identities", force: :cascade do |t|
    t.string  "uid",      limit: 255
    t.string  "provider", limit: 255
    t.integer "user_id",  limit: 4
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "privacies", force: :cascade do |t|
    t.string "rule", limit: 255, null: false
  end

  create_table "profile_skill_tags", force: :cascade do |t|
    t.integer  "skill_id",         limit: 4
    t.integer  "profile_skill_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "profile_skill_tags", ["profile_skill_id"], name: "index_profile_skill_tags_on_profile_skill_id", using: :btree
  add_index "profile_skill_tags", ["skill_id"], name: "index_profile_skill_tags_on_skill_id", using: :btree

  create_table "profile_skills", force: :cascade do |t|
    t.integer "profile_id",       limit: 4
    t.integer "skill_id",         limit: 4
    t.integer "rank",             limit: 4
    t.boolean "primary",          limit: 1
    t.integer "experience_years", limit: 4
    t.text    "description",      limit: 65535
  end

  add_index "profile_skills", ["profile_id", "skill_id"], name: "index_profile_skills_on_profile_id_and_skill_id", using: :btree
  add_index "profile_skills", ["skill_id"], name: "fk_rails_56394d9a6b", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "username",                limit: 255,                 null: false
    t.string   "first_name",              limit: 255
    t.string   "last_name",               limit: 255
    t.text     "bio",                     limit: 65535
    t.string   "phone",                   limit: 255
    t.string   "age",                     limit: 255
    t.boolean  "gender",                  limit: 1
    t.string   "university",              limit: 255
    t.string   "job_title",               limit: 255
    t.string   "job_company",             limit: 255
    t.text     "job_details",             limit: 65535
    t.string   "address",                 limit: 255
    t.float    "latitude",                limit: 24
    t.float    "longitude",               limit: 24
    t.integer  "rank",                    limit: 4
    t.integer  "domain_id",               limit: 4
    t.integer  "user_id",                 limit: 4
    t.string   "facebook",                limit: 255
    t.string   "twitter",                 limit: 255
    t.string   "github",                  limit: 255
    t.string   "linkedin",                limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "avatar_file_name",        limit: 255
    t.string   "avatar_content_type",     limit: 255
    t.integer  "avatar_file_size",        limit: 4
    t.datetime "avatar_updated_at"
    t.string   "status",                  limit: 255,   default: ""
    t.integer  "cached_votes_total",      limit: 4,     default: 0
    t.integer  "cached_votes_score",      limit: 4,     default: 0
    t.integer  "cached_votes_up",         limit: 4,     default: 0
    t.integer  "cached_votes_down",       limit: 4,     default: 0
    t.integer  "cached_weighted_score",   limit: 4,     default: 0
    t.integer  "cached_weighted_total",   limit: 4,     default: 0
    t.float    "cached_weighted_average", limit: 24,    default: 0.0
  end

  add_index "profiles", ["cached_votes_down"], name: "index_profiles_on_cached_votes_down", using: :btree
  add_index "profiles", ["cached_votes_score"], name: "index_profiles_on_cached_votes_score", using: :btree
  add_index "profiles", ["cached_votes_total"], name: "index_profiles_on_cached_votes_total", using: :btree
  add_index "profiles", ["cached_votes_up"], name: "index_profiles_on_cached_votes_up", using: :btree
  add_index "profiles", ["cached_weighted_average"], name: "index_profiles_on_cached_weighted_average", using: :btree
  add_index "profiles", ["cached_weighted_score"], name: "index_profiles_on_cached_weighted_score", using: :btree
  add_index "profiles", ["cached_weighted_total"], name: "index_profiles_on_cached_weighted_total", using: :btree
  add_index "profiles", ["domain_id"], name: "index_profiles_on_domain_id", using: :btree
  add_index "profiles", ["latitude"], name: "index_profiles_on_latitude", using: :btree
  add_index "profiles", ["longitude"], name: "index_profiles_on_longitude", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree
  add_index "profiles", ["username"], name: "index_profiles_on_username", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "skills", ["name"], name: "index_skills_on_name", using: :btree

  create_table "user_privacies", force: :cascade do |t|
    t.integer  "profile_id",   limit: 4,                null: false
    t.integer  "privacies_id", limit: 4,                null: false
    t.boolean  "status",       limit: 1, default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "profile_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag",    limit: 1
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "profile_skills", "profiles"
  add_foreign_key "profile_skills", "skills"
end
