require 'mediawiki_selenium'

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
