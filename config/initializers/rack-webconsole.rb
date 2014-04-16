# encoding: utf-8

require "rack-webconsole"

Rails.configuration.middleware.delete(Rack::Webconsole)
Rack::Webconsole::Repl.reset_token

require "tigron/backstage/ext/rack/webconsole/assets_manager"
require "tigron/backstage/ext/rack/webconsole/tigron_repl"

