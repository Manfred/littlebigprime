# frozen_string_literal: true

# Controller interface for dealing with sessions and authenticated entities.
module Authentication
  def start_session(authenticated_session)
    session[:authenticated] = authenticated_session.secret
  end

  def stop_session
    session.delete(:authenticated)
  end

  def authenticated_session
    return nil unless session[:authenticated]
    return @authenticated_session if defined?(@authenticated_session)

    @authenticated_session = AuthenticatedSession.find_by(secret: session[:authenticated])
  end

  def authenticated
    return @authenticated if defined?(@authenticated)

    @authenticated = authenticated_session&.authenticated
  end
end
