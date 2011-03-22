require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'TJAQ1utgb7XUcOrb8VOFyA', 'WgtAEOXCt3Z6hQTysiSLjcshQ3lzoLUhBrvPAHdv3Q'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end
