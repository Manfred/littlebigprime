# frozen_string_literal: true

# Enable crypto functions, mostly for the UUID features.
class EnablePgcrypto < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end
