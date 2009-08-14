# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_punctuality_score_session',
  :secret      => '6b588ecdbe9f8df872198b233881b5d1bdb2bf17adc191e32c533b9ff5dd7b1e813edb5b50c188ccd84fe9b8724012f16845553d04413ab4139fbf31ec20fe6e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
