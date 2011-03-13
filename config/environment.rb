# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Studdr::Application.initialize!

SUPPORTED_LANGUAGES = [:en, :es]
DEFAULT_LANGUAGE = :en
