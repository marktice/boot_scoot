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

ActiveRecord::Schema.define(version: 20180505024231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "passenger_id"
    t.bigint "driver_id"
    t.string "origin_address"
    t.string "destination_address"
    t.decimal "distance"
    t.decimal "cost"
    t.string "status"
    t.datetime "payed_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.index ["destination_id"], name: "index_bookings_on_destination_id"
    t.index ["driver_id"], name: "index_bookings_on_driver_id"
    t.index ["origin_id"], name: "index_bookings_on_origin_id"
    t.index ["passenger_id"], name: "index_bookings_on_passenger_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "user_id"
    t.string "make"
    t.string "model"
    t.string "number_plate"
    t.string "transmission"
    t.text "car_image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "driver_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "drivers_licence"
    t.string "transport_type"
    t.text "transport_image_data"
    t.boolean "approved", default: false
    t.datetime "approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_driver_profiles_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "phone_number"
    t.string "home_address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.text "avatar_image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reviewee_id"
    t.bigint "reviewer_id"
    t.bigint "booking_id"
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_charge_id"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "users"
  add_foreign_key "driver_profiles", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "bookings"
end
