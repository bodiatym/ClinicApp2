# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name,               null: false, default: ''
      t.string :surname,            null: false, default: ''
      t.string :phone,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :phone,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :profiles, :confirmation_token,   unique: true
    # add_index :profiles, :unlock_token,         unique: true
  end
end
