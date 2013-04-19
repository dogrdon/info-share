# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teacher_share_session',
  :secret      => '2480e03460e2ba4baed866d0f733703529295875749db4f2ab555e8d749cb51caedd4d81ba443a78ebc337604dbecf34c30c741ce3f994a994061e646035ccb3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
