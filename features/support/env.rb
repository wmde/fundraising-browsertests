require 'mediawiki_selenium'
require 'mediawiki_selenium/support'
require 'mediawiki_selenium/step_definitions'

require 'net/http'
require 'active_support/all'
require 'require_all'

config = YAML.load_file('config/config.yml')
config.each do |k, v|
  unless ENV["#{k}"]
    ENV["#{k}"] = "#{v}"
  end
end

require_all 'features/support/utils'
require_all 'features/support/modules'
require_all 'features/support/pages'

PageObject.default_element_wait = 10 # increased to avoid fails
