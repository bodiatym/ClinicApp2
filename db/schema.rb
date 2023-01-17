# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_230_113_132_555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'appointments', force: :cascade do |t|
    t.bigint 'doctor_profile_id'
    t.bigint 'patient_profile_id'
    t.string 'status', default: 'active', null: false
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['doctor_profile_id'], name: 'index_appointments_on_doctor_profile_id'
    t.index ['patient_profile_id'], name: 'index_appointments_on_patient_profile_id'
    t.index ['status'], name: 'index_appointments_on_status'
  end

  create_table 'doctor_categories', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'doctor_profiles', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'doctor_category_id'
    t.index ['doctor_category_id'], name: 'index_doctor_profiles_on_doctor_category_id'
    t.index ['user_id'], name: 'index_doctor_profiles_on_user_id', unique: true
  end

  create_table 'patient_profiles', force: :cascade do |t|
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_patient_profiles_on_user_id', unique: true
  end

  create_table 'recommendations', force: :cascade do |t|
    t.bigint 'appointment_id'
    t.text 'text'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['appointment_id'], name: 'index_recommendations_on_appointment_id', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'surname', default: '', null: false
    t.string 'phone', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'type'
    t.index ['phone'], name: 'index_users_on_phone', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'doctor_profiles', 'doctor_categories'
  add_foreign_key 'doctor_profiles', 'users'
  add_foreign_key 'patient_profiles', 'users'
  add_foreign_key 'recommendations', 'appointments'
end
