# frozen_string_literal: true

module Support
  # Helpers to manage sessions in tests.
  module SessionHelpers
    def login_with_account
      post '/manage/session', params: { authenticated_session_create: { username: 'lilly', password: 'secret' } }
    end

    def login_with_password
      post '/session', params: { authenticated_session_create: { password: 'secret' } }
    end
  end
end
