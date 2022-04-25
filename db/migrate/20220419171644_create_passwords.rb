# frozen_string_literal: true

# Stores the password used to access the service. Multiple passwords can be active at the same time.
class CreatePasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :passwords do |t|
      t.text :digest, null: false
      t.string :prefix, null: false
      t.datetime :deactivated_at
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
