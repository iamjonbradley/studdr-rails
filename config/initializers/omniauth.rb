require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  provider :facebook, "164277726917774", "97ac5af1a1893aad75446c6ad19e1711"
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :twitter, "TJAQ1utgb7XUcOrb8VOFyA", "WgtAEOXCt3Z6hQTysiSLjcshQ3lzoLUhBrvPAHdv3Q"
end
