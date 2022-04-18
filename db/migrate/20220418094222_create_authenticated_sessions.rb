# frozen_string_literal: true

# Creates authenticated sessions table.
class CreateAuthenticatedSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :authenticated_sessions do |t|
      t.string :authenticated_type, null: false
      t.bigint :authenticated_id, null: false
      t.string :secret, null: false

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }

      t.index(
        %i[authenticated_type authenticated_id],
        name: 'index_authenticated_sessions_on_authenticated'
      )
    end
  end
end
