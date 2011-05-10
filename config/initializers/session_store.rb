# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_socialnetwork_session',
  :secret      => '19c281b54c559de105b953d7488b64c847af82e9715576b8228d22a159f16f8c1ee4077249e78d2448409eedcef41bc568be4a2064a11359e7a1219ce36a3ec3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
